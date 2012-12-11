softlutions = {

    anchoMapa: 1600,

    /*
     * Convierte las coordenadas a las apropiadas segun el tamano de la imagen.
     */
    coordConvert: function(coords, imagen){
        var img = document.getElementById(imagen);
        var result = "";
        var c = coords.split(",");
        for(var j=0; j<c.length; j++){
            var porctg = (100 * img.width)/Number(softlutions.anchoMapa);
            result += Math.round((Number(c[j]) * porctg)/100);
            if(j!=c.length-1)
                result += ",";
        }
        return result;
    },
    
    /*
     * Redimensiona las coordenadas de un mapa para ajustarlo
     * a la resolucion y tamaño de pantalla.
     */
    resizeMap: function(imagen, numAreas){
        if(document.getElementById(imagen)!=null){
            document.getElementById(imagen).style.width = "100%";
            for(var i=1; i<=numAreas; i++){
                var area = document.getElementById(imagen+i);
                var newCoords = softlutions.coordConvert(area.coords, imagen);
                area.coords = newCoords;
            }
            softlutions.anchoMapa = document.getElementById(imagen).width;
        }
    },

    openPopup: function(idPopup, xxx){
        var b = document.getElementById("xxx");
        var r = document.getElementById("reproductor");
        if(b){
            if(r)
                r.style.visibility = "hidden";
            if(xxx) b.style.display = "";
            document.getElementById(idPopup).style.display = "";
            
        }
    },

    closePopup: function(idPopup, xxx){
        var b = document.getElementById("xxx");
        var r = document.getElementById("reproductor");
        if(b){
            if(xxx) b.style.display = "none";
            document.getElementById(idPopup).style.display = "none";
            if(r)
                r.style.visibility = "visible";
        }
    },

      
    validarTelefono: function(){
        var telefono = $('.telefono').val();
        if(telefono == '') {
            alert("Your phone is not valid.");
            return false;
        }	
        var phoneReg = /^[0-9]{2,3}-? ?[0-9]{6,7}$/;
        if(!phoneReg.test(jQuery.trim(telefono))) {
            alert("Your phone is not valid.");
            return false;
        }
        return true;
    }
}
