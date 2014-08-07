


function update_switch(id,model,attribute,objectId )
{

    $.ajax({
    url : "/httpapi/v1/change_switch",
    type : "GET",
    dataType: 'json',
    data : "id=" + id + "&model=" + model + "&attribute=" + attribute ,
    success : function(data) {
     if(data.attribute_value==true)
      document.getElementById(objectId).value="NotApprove";
    else
      document.getElementById(objectId).value="Approve";
       //alert( document.getElementById("status_"+id).value);
      //if(data.message);
    }
    });

  //document.getElementById("form"+id).submit();
  //alert(document.getElementById("status_"+id).value);
}