$(function(){
	$('#addr-search-btn').click(fn_searchPopUp);
	$('#place-addr').click(fn_searchPopUp);
	fn_addInput('p_info', '#add-info-list-btn', '#place-info-list');
	fn_addInput('p_remark', '#add-remark-list-btn', '#place-remark-list');
	fn_removeInput('#remove-info-list-btn', '#place-info-list');
	fn_removeInput('#remove-remark-list-btn', '#place-remark-list');
	fn_addFacility($('.add-facility-btn').last());
	fn_addOption();
	fn_previewThumbnail('#upload-btn');
	fn_previewThumbnail('#option-thumbnail');
	fn_removeOption();
	fn_deleteOption();
})
/* 등록되어 있던 옵션 삭제 */
function fn_deleteOption(){
	$('.select-remove-btn').click(function(event){
		if(confirm('복구가 불가능합니다 삭제하시겠습니까?')){
			$.ajax({
				url:'placeOptionDelete.place/'+$(event.target).prev().val(),
				type:'delete',
				dataType:'json',
				success:function(responseObj){
					if(responseObj.result > 0){
						alert('삭제되었습니다.');
					} else {
						alert('삭제에 실패했습니다. 다시 시도해주세요');
					}
				},
				error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
	});
}


/* 주소 찾기 */
function fn_searchPopUp(){
	new daum.Postcode({
		oncomplete : function(data){
			let addr = '';
			let extraAddr = '';
			
			if(data.userSelectedType ==='R'){
				addr = data.roadAddress;
				extraAddr = data.bname;
			} else {
				addr = data.jibunAddress;
				extraAddr = data.bname;
			}
			$('#place-addr').val(addr);
			$('#place-bname').val(extraAddr);
			$('#place-addr-detail').focus();
		}
	}).open();
}

/* insert submit 전 카테고리 선택 검사 */
function fn_placeInsert(f){
	if(f.pc_no.value==''){
		alert('카테고리를 선택해 주세요');
		return;
	}
	if(f.p_img.value==''){
		alert('공간 썸네일을 선택해주세요');
		return;
	}
	if(f.po_img.value==''){
		alert('옵션의 이미지파일을 선택해주세요');
		return;
	}
	f.action = 'placeInsert.place';
	f.submit();
}

/* list를 추가하기 위한 */
function fn_addInput(inputName, btn, tag){
	$(btn).click(function(){
		if($(tag).find('li').length>9){
			alert('최대 10개까지입니다.');
			return;
		}
		let addInput = '<li><input class="place-input" type="text" name="'+inputName+'" placeholder="추가하려면 추가 버튼을 눌러주세요" required /></li>';
		$(tag).append(addInput);
	})
}
function fn_removeInput(btn, tag){
	$(btn).click(function(event){
		if($(tag).find('li').length<2){
			alert('최소 1개는 필수입니다.');
			return;
		}
		$(tag).find('li').last().remove();
	});
}

function fn_addFacility(btn){
	$(btn).click(function(event){
		let facilityInput = $(event.target).prev();
		let value = $(facilityInput).val();
		let ul = $(event.target).next();
		let countInput = $(event.target).next().next();
		if(value==''){
			alert('편의시설을 입력해주세요');
			$(facilityInput).focus();
			return;
		}
		if($(ul).find('li').length>7){
			alert('8개이상 추가할 수 없습니다.');
			return;
		}
		let addList = '<li>'+value+'<input type="hidden" name="po_facility" value="'+value+'" /><span class="remove" onclick="fn_removeFacility(event)">&times;</span></li>';
		$(ul).append(addList);
		$(facilityInput).val('');
		$(countInput).val(parseInt($(countInput).val())+1);
		$(facilityInput).focus();
	});
}
function fn_removeFacility(e){
	let facilityCount = $(e.target).closest('#facility-list').next();
	$(e.target).parent().remove();
	$(facilityCount).val(parseInt($(facilityCount).val())-1);
}
function fn_addOption(){
	$('#add-option-btn').click(function(event){
		let strHtml =`
			<section class="option">
			<article class="option-box">
				<div class="option-subtitle">
					공간이름<span class="required-data">필수 사항</span>
				</div>
				<div class="option-content">
					<input class="option-input" type="text" name="po_name" />
					<span id="character-length" ></span>
				</div>
			</article>
			<article class="option-box">
				<div class="option-subtitle">
					가격<span class="required-data">필수 사항</span>
				</div>
				<div class="option-content">
					평일 : <input type="number" name="po_dayPrice" required />원
					주말(공휴일) : <input type="number" name="po_holiday" required/>원
				</div>
			</article>
			<article class="option-box">
				<div class="option-subtitle">
					인원<span class="required-data">필수 사항</span>
				</div>
				<div class="option-content">
					최소 : <input type="number" name="po_min" required />
					최대 : <input type="number" name="po_max" required />
				</div>
			</article>
			<article class="option-box">
				<div class="option-title">
					편의시설
				</div>
				<div class="option-content">
					<input type="text" />
					<button type="button" class="add-facility-btn" >편의시설 추가</button>
					<ul id="facility-list">
						
					</ul>
				</div>
			</article>
			<article class="option-box">
			<div class="option-subtitle">
				썸네일<span class="required-data">필수 사항</span>
			</div>
			<div class="option-content">
				<label for="option-thumbnail">사진 고르기</label>
				<input id="option-thumbnail" type="file" name="po_img" required/>
				<div id="option-img-box">
				
				</div>
			</div>
			</article>
		`;
		if($('section.option').length == 0){
			$('section.btn-box').before(strHtml);
		} else {
			$('section.option').last().after(strHtml);
		}
		fn_addFacility($('.add-facility-btn').last());
		fn_previewThumbnail('#option-thumbnail');
	});
}
function fn_removeOption(){
	$('#remove-option-btn').click(function(){
		$('section.option').last().remove();
	})
}

/* 첨부이미지 미리보기 */
function fn_previewThumbnail(btn){
	$(btn).on('change', function(event){
		$(btn).next().empty();
		for (let image of event.target.files) { 
			
			let reader = new FileReader();
		
			reader.onload = function(event) {
				$(btn).next().append($('<img>').prop('src', event.target.result));
			};
			reader.readAsDataURL(image);
		}
		$(btn).parent().next().val(1);
	});
}