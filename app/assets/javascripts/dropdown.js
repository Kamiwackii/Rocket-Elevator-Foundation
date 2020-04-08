//building type dropdown menu selection function
jQuery(document).ready(function() {
    
    $("select#building_id").hide();
    $("#building_label").hide();

    $("select#battery_id").hide();
    $("#battery_label").hide();

    $("select#column_id").hide();
    $("#column_label").hide();

    $("select#elevator_id").hide();
    $("#elevator_label").hide();

});
    
$("select#customer_id").change(function() {
    var id_value_string = $(this).val();
    if (id_value_string == "") {
        $("select#building_id option").remove();
        var row = "<option value=\"" + "nulltest" + "\" selected>" + "buildings" + "</option>";
        $(row).appendTo("select#building_id");
    } else {
        // Send the request and update course dropdown
        $.ajax({
            dataType: "json",
            cache: false,
            url: '/get_building_by_customer/' + id_value_string,
            timeout: 5000,
            error: function(XMLHttpRequest, errorTextStatus, error) {
                alert("Failed to submit : " + errorTextStatus + " ;" + error);
            },
            success: function(data) {
                // Clear all options from course select
                $("select#building_id option").remove();
                //put in a empty default line
                var row = "<option value=\"" + "nulltest" + "\"selected>" + "buildings" + "</option>";
                $(row).appendTo("select#building_id");
                // Fill course select
                $.each(data, function(i, j) {
                    row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                    $(row).appendTo("select#building_id");
                });
            }
        });
    }
    ShowHide();
});

$("select#building_id").change(function() {
    var id_value_string = $(this).val();
    console.log(id_value_string)
    if (id_value_string == "") {
        $("select#battery_id option").remove();
        var row = "<option value=\"" + "nulltest" + "\" selected>" + "batteries" + "</option>";
        $(row).appendTo("select#battery_id");
    } else {
        // Send the request and update course dropdown
        $.ajax({
            dataType: "json",
            cache: false,
            url: '/get_battery_by_building/' + id_value_string,
            timeout: 5000,
            error: function(XMLHttpRequest, errorTextStatus, error) {
                alert("Failed to submit : " + errorTextStatus + " ;" + error);
            },
            success: function(data) {
                // Clear all options from course select
                $("select#battery_id option").remove();
                //put in a empty default line
                var row = "<option value=\"" + "nulltest" + "\" selected>" + "batteries" + "</option>";
                $(row).appendTo("select#battery_id");
                // Fill course select
                $.each(data, function(i, j) {
                    row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                    $(row).appendTo("select#battery_id");
                });
            }
        });
    }
    ShowHide();
});

$("select#battery_id").change(function() {
    var id_value_string = $(this).val();
    console.log(id_value_string)
    if (id_value_string == "") {
        $("select#column_id option").remove();
        var row = "<option value=\"" + "nulltest" + "\" selected>" + "batteries" + "</option>";
        $(row).appendTo("select#column_id");
    } else {
        // Send the request and update course dropdown
        $.ajax({
            dataType: "json",
            cache: false,
            url: '/get_column_by_battery/' + id_value_string,
            timeout: 5000,
            error: function(XMLHttpRequest, errorTextStatus, error) {
                alert("Failed to submit : " + errorTextStatus + " ;" + error);
            },
            success: function(data) {
                // Clear all options from course select
                $("select#column_id option").remove();
                //put in a empty default line
                var row = "<option value=\"" + "nulltest" + "\" selected>" + "columns" + "</option>";
                $(row).appendTo("select#column_id");
                // Fill course select
                $.each(data, function(i, j) {
                    row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                    $(row).appendTo("select#column_id");
                });
            }
        });
    }
    ShowHide();
});

$("select#column_id").change(function() {
    var id_value_string = $(this).val();
    console.log(id_value_string)
    if (id_value_string == "") {
        $("select#elevator_id option").remove();
        var row = "<option value=\"" + "nulltest" + "\" selected>" + "elevators" + "</option>";
        $(row).appendTo("select#elevator_id");
    } else {
        // Send the request and update course dropdown
        $.ajax({
            dataType: "json",
            cache: false,
            url: '/get_elevator_by_column/' + id_value_string,
            timeout: 5000,
            error: function(XMLHttpRequest, errorTextStatus, error) {
                alert("Failed to submit : " + errorTextStatus + " ;" + error);
            },
            success: function(data) {
                // Clear all options from course select
                $("select#elevator_id option").remove();
                //put in a empty default line
                var row = "<option value=\"" + "nulltest" + "\" selected>" + "elevators" + "</option>";
                $(row).appendTo("select#elevator_id");
                // Fill course select
                $.each(data, function(i, j) {
                    row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
                    $(row).appendTo("select#elevator_id");
                });
            }
        });
    }
    ShowHide();
});

function ShowHide () {
    $("select#building_id").hide();
    $("#building_label").hide();
    $("select#battery_id").hide();
    $("#battery_label").hide();
    $("select#column_id").hide();
    $("#column_label").hide();
    $("select#elevator_id").hide();
    $("#elevator_label").hide();
    if ($("select#customer_id").val() != "nulltest") {
        $("select#building_id").show();
        $("#building_label").show();
        if ($("select#building_id").val() != "nulltest") {
            $("select#battery_id").show();
            $("#battery_label").show();
            if ($("select#battery_id").val() != "nulltest") {
                $("select#column_id").show();
                $("#column_label").show();
                if ($("select#column_id").val() != "nulltest") {
                    $("select#elevator_id").show();
                    $("#elevator_label").show();
                }
            }
        }
    }
};