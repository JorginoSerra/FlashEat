<%@include file="/html/common/header.jsp"%>

<h1>Autocomplete Example</h1>
<select id="paisList" style="width:33%;" onChange="getProvincias(this.value);">
<option>seleccionar pais</option>
<option value="ES">ESPAÑA</option>
<option value="US">ESTADOS UNIDOS</option>
</select>
<select id="provinciaList" style="width:33%;" onChange="getLocalidades(this.value);"></select>
<select id="localidadList" style="width:33%;"></select>

<script>
function getProvincias(val) {
	$.ajax({
		type: "GET",
		url: "/FlashEat/provinciaws",
		data:"m=pais&pais="+val,
		success: function(data){
			console.log(data);
			
			$("#provinciaList").empty();
			// $("#provincia-list").html(data);	 -- si fuese html
			
            for(var i=0;i<data.length;i++){
                $("#provinciaList")
                	.append("<option value='" +data[i].id+"'>"+ data[i].nombre + "</option>");
            }			
		
			$("#localidadList").empty();
		}
	});
}
function getLocalidades(val) {
	$.ajax({
		type: "GET",
		url: "/FlashEat/provinciaws",
		data:"m=loc&loc="+val,
		success: function(data){
			console.log(data);
			
			$("#localidadList").empty();
			// $("#provincia-list").html(data);	 -- si fuese html
			
            for(var i=0;i<data.length;i++){
                $("#localidadList")
                	.append("<option value='" +data[i].id+"'>"+ data[i].Nombre +"</option>");
            }			
		
		}
	});
}

</script>