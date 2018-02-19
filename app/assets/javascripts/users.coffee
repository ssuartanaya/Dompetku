ready = -> 
    $("#form_transaksi").hide()
    $("body").on "click", "#tombol_form", (e) ->
        e.preventDefault()
        $("#form_transaksi").toggle("slow")

$(document).ready(ready);
$(document).on('page:load', ready);