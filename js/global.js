$(function(){
    changeClassContainer();

    $(window).resize(function() {
        changeClassContainer();
    });

    let $cbp_menu = $('#cbp-spmenu-s1');
    $cbp_menu.removeClass('cbp-spmenu');
    $cbp_menu.removeClass('cbp-spmenu-vertical');

    $(document).on('focus', ':input', function(){$(this).attr('autocomplete', 'off');});


    $( "#accordion_menu" ).accordion({
        heightStyle: "content",
        collapsible: true
    });

    $('#motivoPausa').chosen({width:'100%'});
});

function changeClassContainer() {
    let mainContainerWidth = $(window).width();
    let $container = $('#mainContainer, #topContainer, #bottomContainer');
    if (mainContainerWidth < 1201) {
        $container.removeClass('container');
        $container.addClass('container-fluid');
    } else {
        $container.addClass('container');
        $container.removeClass('container-fluid');
    }
}

function esperar() {
    $(".container-fluid").LoadingOverlay("show", {
        imageResizeFactor: "0.5",
        text        : "Cargando siguiente cliente...",
        textResizeFactor:"0.25",
        textAutoResize: "false",
        imageColor: "#0978BD"});
}

function custom_swal(selector, tipo, titulo, texto, btn, focus) {
    const swalWithBootstrapButtons = swal.mixin({
        confirmButtonClass: 'btn btn-'+btn,
        buttonsStyling: false
    })

    swalWithBootstrapButtons({
        title: titulo,
        text: texto,
        type: tipo,
        showCancelButton: false,
        confirmButtonText: 'OK',
        reverseButtons: true
    }).then(() => {
        if (focus === true) {
            $(selector).focus();
        }
    });
}

function swal_validar(texto) {
    const swalWithBootstrapButtons = swal.mixin({
        confirmButtonClass: 'btn btn-danger',
        buttonsStyling: false
    })

    swalWithBootstrapButtons({
        title: '¡Error!',
        text: texto,
        type: 'error',
        showCancelButton: false,
        confirmButtonText: 'Cerrar',
        reverseButtons: true
    });
}

function swal_ok(texto) {
    const swalWithBootstrapButtons = swal.mixin({
        confirmButtonClass: 'btn btn-success',
        buttonsStyling: false
    })

    swalWithBootstrapButtons({
        title: '¡Hecho!',
        text: texto,
        type: 'success',
        showCancelButton: false,
        confirmButtonText: 'Cerrar',
        reverseButtons: true
    });
}

function campo_fecha(selector, fechaMax, fechaMin) {
    $(selector).datepicker({
        changeMonth: true,
        changeYear: true,
        currentText: 'Ahora',
        closeText: 'Cerrar',
        maxDate: fechaMax,
        minDate: fechaMin
    });
}

function campo_agenda(selector){
    $(selector).datetimepicker({
        timeOnlyTitle: 'Elija una hora',
        timeText: 'Hora',
        hourText: 'Hora',
        minuteText: 'Minutos',
        currentText: 'Ahora',
        closeText: 'Cerrar',
        controlType: 'select',
        timeFormat: 'hh:mm tt',
        hourMin: 7,
        hourMax: 20,
        showTime: false,
        showButtonPanel: false,
        minDate: "+0D",
        beforeShowDay: function(date) {
            var day = date.getDay();
            return [(day != 0), ''];
        }
    });
}

$(function($){
    $.datepicker.regional['es'] = {
        closeText: 'Cerrar',
        prevText: '<Ant',
        nextText: 'Sig>',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
        dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
        weekHeader: 'Sm',
        dateFormat: 'dd/mm/yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['es']);
});

function mayuscula(field) {
    $(field).val (function () {
        return this.value.toUpperCase();
    });
}

function minuscula(field) {
    $(field).val (function () {
        return this.value.toLowerCase();
    });
}


function validate_input(minlength, maxlength, value){
    let msg = '';

    if (value.length<minlength) {
        msg = ' debe tener al menos '+minlength+' caracteres';
    }
    else if (value.length>maxlength) {
        msg = ' no debe tener más de '+maxlength+' caracteres';
    }

    return msg;
}

function validate_num(minval, maxval, value){
    let msg = '';

    if (value < minval) {
        msg = ' debe tener un valor mayor o igual que '+minval;
    }
    else if (value > maxval) {
        msg = ' debe tener un valor menor o igual que '+maxval;
    }

    return msg;
}

function validate_select(value){
    let msg = '';

    if (value < 1) {
        msg = ' debe tener una opción seleccionada';
    }

    return msg;
}

function validate_error(field, msg, name) {
    $(field).focus();
    $(field).trigger('chosen:activate');
    $(field).addClass('validate_red');
    swal_validar('El campo '+'"'+name+'"'+msg);
}

function texto_limpio(cadena) {
    let s1 = "ÃÀÁÄÂÈÉËÊÌÍÏÎÒÓÖÔÙÚÜÛãàáäâèéëêìíïîòóöôùúüûÑñÇç";
    let s2 = "AAAAAEEEEIIIIOOOOUUUUaaaaaeeeeiiiioooouuuunncc";
    for (let i = 0; i < s1.length; i++) cadena = cadena.replace(new RegExp(s1.charAt(i), 'g'), s2.charAt(i));
    return cadena;
}

$('#anc_pausa').click(function () {
    $('#modalPausa').modal()
})