$("#submitChangeNewPassword").click((e) => {
    e.preventDefault()
    let oldPassword = $("#oldPassword").val()
    let newPassword = $("#newPassword").val()
    if (!checkValidation()) {
        return
    }
    $.ajax(
        {
            url: `/project_war/newCustomerPassword`,
            type: 'POST',
            data: {
                "oldPassword": oldPassword,
                "newPassword": newPassword
            },
            success: function (result) {
                if (result == "wrong") {
                    $("#validation-oldPassword").text("wrong password")
                } else if (result == "fail") {
                    $("#validation-newPassword").text("fail to change")
                } else {
                    $("#validation-newPassword").text("success to change")
                }
            }
        }
    );
})

function checkValidation() {
    let oldPassword = $("#oldPassword").val()
    let newPassword = $("#newPassword").val()
    let confirmNewPassword = $("#confirmNewPassword").val()
    if (newPassword.length < 8) {
        $("#validation-newPassword").text("password is too short")
    }
    if (newPassword.length > 16) {
        $("#validation-newPassword").text("password is too long")
        return false
    }
    if (newPassword != confirmNewPassword) {
        $("#validation-confirmPassword").text("not correct")
        return false
    }
    return true
}