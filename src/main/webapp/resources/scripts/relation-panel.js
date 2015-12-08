$(document).ready(function () {

    $("#make-file").on("click", function () {
        $(".relation-row").each(function () {
            console.log($(this).find(".node-name").val());
            console.log($(this).find(".rus-name").val());
            console.log($(this).find(".eng-name").val());
        });
        alert(isRelationListValid());
    });

    $("#add-relation").on("click", function () {
        var $relationRow = $("<div>").addClass("relation-row");
        var $nodeNameInput = $("<input>").addClass("node-name").attr("type", "text").attr("placeholder", "Sс идентификатор");
        var $rusNameInput = $("<input>").addClass("rus-name").attr("type", "text").attr("placeholder", "Русский идентификатор");
        var $engNameInput = $("<input>").addClass("eng-name").attr("type", "text").attr("placeholder", "Английский идентификатор");
        $relationRow.append($nodeNameInput).append($rusNameInput).append($engNameInput);
        $("#relation-list").append($relationRow);
    });


    function isRelationListValid() {
        var isValid = true;

        $(".relation-row").each(function () {
            var $row = $(this);
            if ($row.find(".node-name").val() == ""
                || $row.find(".rus-name").val() == ""
                || $row.find(".eng-name").val() == "") {
                isValid = false;
            }

        });
        return isValid;
    }


});
