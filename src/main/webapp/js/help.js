/**
 * 
 */
var currentPage = 1;
listPageServer = function(area ,tit, word, search, cpage){
	$.ajax({
		url : '/studditproject/helpList.do',
		type : 'get',
		data  : {
			"type-area" : area,
			"type-tit" : tit,
			"sword" : word ,
			"ssearch" : search,
			"page" : cpage
			},
		success : function(resData){
			console.log(area, tit, word, search, cpage);
			let navCode = '<ul class="nav nav-tabs me-auto mb-2 mb-lg-0">';
			navCode += '<li class="nav-item dropdown">';
			navCode += '<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>';
			navCode += '<ul class="dropdown-menu">';
			
			if(word == ''){
				navCode += '<li><a class="dropdown-item move-item active" href="#">전체</a></li>';
			} else{
				navCode += '<li><a class="dropdown-item move-item" href="#">전체</a></li>';
			}
			
			if(word == 'JAVA'){
				navCode += '<li><a class="dropdown-item move-item active" href="#">JAVA</a></li>';
			} else{
				navCode += '<li><a class="dropdown-item move-item" href="#">JAVA</a></li>';
			}
			
			if(word == 'DATABASE'){
				navCode += '<li><a class="dropdown-item move-item active" href="#">DATABASE</a></li>';
			} else{
				navCode += '<li><a class="dropdown-item move-item" href="#">DATABASE</a></li>';
			}
			
			if(word == 'HTML&CSS'){
				navCode += '<li><a class="dropdown-item move-item active" href="#">HTML&CSS</a></li>';
			} else{
				navCode += '<li><a class="dropdown-item move-item" href="#">HTML&CSS</a></li>';
			}
			
			if(word == 'JSP'){
				navCode += '<li><a class="dropdown-item move-item active" href="#">JSP</a></li> ';
			} else{
				navCode += '<li><a class="dropdown-item move-item" href="#">JSP</a></li> ';
			}
			
			if(word == 'PYTHON'){
				navCode += '<li><a class="dropdown-item move-item active" href="#">PYTHON</a></li> ';
			} else{
				navCode += '<li><a class="dropdown-item move-item" href="#">PYTHON</a></li> ';
			}
			
			if(word == 'SPRING'){
				navCode += '<li><a class="dropdown-item move-item active" href="#">SPRING</a></li> ';
			} else{
				navCode += '<li><a class="dropdown-item move-item" href="#">SPRING</a></li> ';
			}
			
			navCode += '</ul>';
			navCode += '</ul>';	
			navCode += '<form class="d-flex" role="search">';
			navCode += '<input id="search-val" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" value="' + search + '">';
			navCode += '<button id="btn-search" class="btn btn-outline-success" type="button">Search</button>';
			navCode += '</form>';
			$('#navbarSupportedContent').html(navCode);
			let htmlCode = '<table class="board-table">';
			htmlCode += '<thead>';
			htmlCode += '<tr>';
			htmlCode += '<th scope="col" class="th-num">번호</th>';
			htmlCode += '<th scope="col" class="th-title">제목</th>';
			htmlCode += '<th scope="col" class="th-writer">작성자</th>';
			htmlCode += '<th scope="col" class="th-date">등록일</th>';
			htmlCode += '<th scope="col" class="th-writer">조회수</th>';
			htmlCode += '</tr>';
			htmlCode += '</thead>';
			htmlCode += '<tbody>';
			$.each(resData.lists, function(i, v){
				htmlCode += '<tr class="move-detail">';
				htmlCode += '<td>' + v.bor_code + '</td>';
				htmlCode += '<th>';
				htmlCode += '<div>[' + v.bor_area + '] ' + v.bor_tit + '</div>';
				htmlCode += '</th>';
				htmlCode += '<td>' + v.std_nname + '</td>';
				htmlCode += '<td>' + v.bor_rpd + '</td>';
				htmlCode += '<td>' + v.bor_hit + '</td>';
				htmlCode += '</tr>';
			});
			htmlCode += '</tbody>';
			htmlCode += '</table>';
			
			$('#board-section').html(htmlCode);
			
			let pager = '<ul class="pagination justify-content-center">';	
			
			if(resData.spage > 1){
				pager += '<li class="page-item">';
				pager += '<button id="btn-previous" class="page-link" aria-label="Previous"><span aria-hidden="true">&laquo;</span></button>';
				pager += '</li>';	
			} else {
				pager += '<li class="page-item disabled">';
				pager += '<button id="btn-previous" class="page-link" aria-label="Previous"><span aria-hidden="true">&laquo;</span></button>';
				pager += '</li>';
			}
			
			
			for(i=resData.spage ; i<= resData.epage; i++){
				
				if(cpage == i){
					pager += '<li class="page-item page-inner active"><button class="page-link">' + i + '</button></li>';
				}else {
					pager += '<li class="page-item page-inner"><button class="page-link">' + i + '</button></li>';
				}
			}
			
			if(resData.tpage == 0){
				pager += '<li class="page-item page-inner active"><button class="page-link">' + 1 + '</button></li>';
			}
			
			if(resData.tpage > resData.epage){
				pager += '<li class="page-item">';
				pager += '<button id="btn-next" class="page-link" aria-label="Next"><span aria-hidden="true">&raquo;</span></button>';
				pager += '</li>';
			} else {
				pager += '<li class="page-item disabled">';
				pager += '<button id="btn-next" class="page-link" aria-label="Next"><span aria-hidden="true">&raquo;</span></button>';
				pager += '</li>';
			}
			pager += '</ul>';
			
			$('.page-section').html(pager);
		},
		error : function(xhr){
			alert("상태" + xhr.status);
		},
		dataType : 'json'
	});
}

commentList = function(code, reply, check, id, choice){
	$.ajax({
			url : '/studditproject/commentRepeat.do',
			type : 'get',
			data : {
				"code" : code,
			},
			success : function(resData){
				let htmlCode = "";
				$.each(resData.clist, function(i,v){
					if(choice == v.cmt_code){
						htmlCode += '<div class="comment-box choice-box">';
						htmlCode += '<div class="comment-box-left">'
						htmlCode += '<div class="cmt-code">' + v.cmt_code + '</div>';
						htmlCode += '<div class="std_id">' + v.std_id + ' | ' + v.cmt_rvd + '&nbsp;&nbsp;<span class="badge bg-secondary">채택</span></div><br>';
						htmlCode += '<div class="cmt_con">' + v.cmt_con + '</div>';
						htmlCode += '</div>';
						htmlCode += '<div class="comment-box-right">';
						htmlCode += '</div>';
						htmlCode += '</div>';
						htmlCode += '</div>';
					}
					
				});
				$.each(resData.clist, function(i,v){
					htmlCode += '<div class="comment-box">';
					if(v.cmt_code == reply){
						htmlCode += '<div class="comment-box-left">'
						htmlCode += '<div class="cmt-code">' + v.cmt_code + '</div>';
						htmlCode += '<div class="std_id">' + v.std_id + ' | ' + v.cmt_rvd + '</div><br>';
						//htmlCode += '<div class="cmt_rvd">' + v.cmt_rvd + '</div>';
						htmlCode += '<div class="cmt_con">' + v.cmt_con + '</div>';
						htmlCode += '<div class="form-floating">';
						htmlCode += '<textarea class="form-control" placeholder="수정하기" id="reply-update-box"></textarea>';
						htmlCode += '</div>';
						htmlCode += '</div>';
						htmlCode += '<div class="comment-box-right">';
						htmlCode += '<button class="cmt-inner-update btn btn-outline-secondary" value="' + v.cmt_code + '">확인</button>';
						htmlCode += '<button class="cmt-back btn btn-outline-danger" value="">취소</button>';
						htmlCode += '</div>';
						htmlCode += '</div>';
					} else{
						if(check == 1 && id != v.std_id && choice == ""){
							htmlCode += '<div class="comment-box-left">'
							htmlCode += '<div class="cmt-code">' + v.cmt_code + '</div>';
							htmlCode += '<div class="std_id">' + v.std_id + ' | ' + v.cmt_rvd + '</div><br>';
							//htmlCode += '<div class="cmt_rvd">' + v.cmt_rvd + '</div>';
							htmlCode += '<div class="cmt_con">' + v.cmt_con + '</div>';
							htmlCode += '</div>';
							htmlCode += '<div class="comment-box-right">';
							htmlCode += '<button class="cmt-choice btn btn-outline-success" value="' + v.cmt_code + '">채택</button>';
							htmlCode += '</div>';
							htmlCode += '</div>';
						}else{
							if(id == v.std_id){
								htmlCode += '<div class="comment-box-left">'
								htmlCode += '<div class="cmt-code">' + v.cmt_code + '</div>';
								htmlCode += '<div class="std_id">' + v.std_id + ' | ' + v.cmt_rvd + '</div><br>';
								//htmlCode += '<div class="cmt_rvd">' + v.cmt_rvd + '</div>';
								htmlCode += '<div class="cmt_con">' + v.cmt_con + '</div>';
								htmlCode += '</div>';
								htmlCode += '<div class="comment-box-right">';
								htmlCode += '<button class="cmt-update btn btn-outline-success" value="' + v.cmt_code + '">수정</button>';
								htmlCode += '<button class="cmt-delete btn btn-outline-danger" value="' + v.cmt_code + '">삭제</button>';
								htmlCode += '</div>';
								htmlCode += '</div>';
							}else{
								htmlCode += '<div class="comment-box-left">'
								htmlCode += '<div class="cmt-code">' + v.cmt_code + '</div>';
								htmlCode += '<div class="std_id">' + v.std_id + ' | ' + v.cmt_rvd + '</div><br>';
								//htmlCode += '<div class="cmt_rvd">' + v.cmt_rvd + '</div>';
								htmlCode += '<div class="cmt_con">' + v.cmt_con + '</div>';
								htmlCode += '</div>';
								htmlCode += '<div class="comment-box-right">';
								htmlCode += '</div>';
								htmlCode += '</div>';
							}

						}
					}
						
				});
				$('#reply-box').html(htmlCode);
			},
			error : function(xhr){
				alert("상태" + xhr.status);
			},
			dataType : 'json'
		});
}