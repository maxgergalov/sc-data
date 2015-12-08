$(document).ready(function () {


    $("#redirect-to-upload-form").on("click", function () {
        $(location).attr('href', 'relationviewer');
    });

    $("#save-into-scs").on("click", function () {
        var id = $("#notion-id").val();
        if (id !== "") {
            var notion = {};
            $(".notion-attr-row").each(function () {
                notion[$(this).find(".rel-key").val()] = $(this).find(".rel-value").val();
            });
            $.ajax({
                url: "/makeScs",
                method: "GET",
                data: {
                    id: id,
                    notion: JSON.stringify(notion)
                },
                success: function (data) {
                    var element = document.createElement('a');
                    element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(data.body));
                    element.setAttribute('download', data.name + ".scs");
                    element.style.display = 'none';
                    document.body.appendChild(element);
                    element.click();
                    document.body.removeChild(element);
                }
            })
        } else alert("У понятия должен быть идентификатор!");
    });

    $("#make-preview").on("click", function () {
        var id = $("#notion-id").val();
        if (id !== "") {
            var notion = {};
            $(".notion-attr-row").each(function () {
                notion[$(this).find(".rel-key").val()] = $(this).find(".rel-value").val();
            });
            $.ajax({
                url: "/makeScs",
                method: "GET",
                data: {
                    id: id,
                    notion: JSON.stringify(notion)
                },
                success: function (data) {
                    $("#scs-preview").val(data.body);
                }
            })
        } else alert("У понятия должен быть идентификатор!");
    });

});




