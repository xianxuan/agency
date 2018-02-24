name_pic=1;
flagImg = 0;
function t1(o,ths){
	var fileId = "#file"+o;
	if ($(fileId).val() == "") {  
        alert("请上传图片");  
        return false;  
    }
	if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test($(fileId).val())) {  
            alert("图片类型必须是.gif,jpeg,jpg,png中的一种");  
            $(fileId).val("");  
            return false;
    }  
    if(o==1 || name_pic!=1){
    var file="file"+o;
    var img="img"+o;
    var hid="hidden"+o;
    var aa="a"+o;
    }else{
    var file="file"+name_pic;
    var img="img"+name_pic;
    var hid="hidden"+name_pic;
    var aa="a"+name_pic;
    }
    var docObj = document.getElementById(file);
    var imgObjPreview = document.getElementById(img);
    var hidden=document.getElementById(hid);
    if (docObj.files && docObj.files[0]) {
        hidden.src=window.URL.createObjectURL(docObj.files[0]); //获取file文件的路径
        hidden.onload=function(){
            var width=hidden.width;
            var height=hidden.height;
            var a=document.getElementById(aa);
                if(width>height){
                imgObjPreview.style.cssText='width:100%';   //重写css样式
                }else{
                imgObjPreview.style.cssText='height:100%;width:auto;';                  
                }
        imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
        imgObjPreview.style.display = 'block';
        }
    }else{
        return false;
    }
    if(o==name_pic){
        var count=$('.pro_img').length;
        if(count<=6){
        name_pic++;
        var pic_div="<div id='del"+name_pic+"'><a class='pro_img' id='a"+name_pic+"' onclick='deleteImg("+name_pic+")'><input type='file' id='file"+name_pic+"'  accept='image/*' multiple='multiple' name='myFile' onchange='t1("+name_pic+"),this'/><img src='/agency/jsp/Images/upload.jpg' style='height:100%;' id='img"+name_pic+"'></a><img  id='hidden"+name_pic+"' style='display:none;'></div>";          
       if(count<6) 
    	  {
    	  $('#upload').append(pic_div);
    	  }
       var fileId = "#file" + (name_pic-1);
	    $(fileId).hide();
       if(count == 6)
    	   {
    	   flagImg = 1;
    	   }
       
    }
}

}
function deleteImg(o){
	var fileId = "#file"+o;
	if ($(fileId).val() != "" && $(fileId).val() != null) {  
		if(confirm("确定要删除吗？"))
		{
			var delId = "#del"+o;
			$(delId).remove();
			if(flagImg==1){
				var pic_div="<div id='del"+name_pic+"'><img src='/agency/jsp/Images/delete.jpg' id='delImg"+name_pic+"'   onclick='del("+name_pic+")' style='display:none;height:20px;weight:20px;margin-left:289px;margin-top:10px;position:absolute;z-index:99'><a class='pro_img' id='a"+name_pic+"' ><input type='file' id='file"+name_pic+"'  accept='image/*' multiple='multiple' name='myFile' onchange='t1("+name_pic+"),this'/><img src='/agency/jsp/Images/upload.jpg' style='height:100%;' id='img"+name_pic+"'></a><img  id='hidden"+name_pic+"' style='display:none;'></div>";          
				$('#upload').append(pic_div);
				flagImg = 0;
			}	
		} 
    }
	
}