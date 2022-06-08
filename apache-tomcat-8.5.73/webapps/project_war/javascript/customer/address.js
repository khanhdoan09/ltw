function renderCity(id) {
    let city = cities.find(element => element.code == id)
    return city.name
}
function renderDistrict(id) {
    let district = districts.find(element => element.code == id)
    return district.name
}
function renderWard(id) {
    let ward = wards.find(element => element.code == id)
    return ward.name
}

$(function() {
    loadCity()
    loadDistrict(89)
    loadWard(883)
    $('#contain-option-city').on('change', function () {
        let cityCode = $(this).val();
        alert(cityCode)
        loadDistrict(cityCode);
        let codeFirstDistrict = "";
        for (let i = 0; i < districts.length; i++) {
            if (districts[i].parent_code == cityCode) {
                codeFirstDistrict = districts[i].code;
                break;
            }
        }
        $("#contain-option-ward").text("");
    });
    $('#contain-option-district').on('change', function (e) {
        let districtCode = $(this).val();
        loadWard(districtCode);
    });

    function loadCity() {
        let city = "";
        cities.forEach((element) => {
            city += "<option value=\"" + element.code + "\"" + "class=\"city\">" + element.name + "</option>\n";
        });
        $("#contain-option-city").append(city);
    }
    function loadDistrict(districtCode) {
        districtArr = districts.filter((value) => value.parent_code == districtCode);
        let district = "";
        districtArr.forEach((element) => {
            district += "<option value=\"" + element.code + "\"" + "class=\"district\">" + element.name + "</option>\n";
        });
        $("#contain-option-district").text("");
        $("#contain-option-district").append(district)
    }
    function loadWard(wardCode) {
        let wardArr = wards.filter((value) => value.parent_code == wardCode);
        let ward = "";
        wardArr.forEach((element) => {
            ward += "<option value=\"" + element.code + "\"" + "class=\"ward\">" + element.name + "</option>\n";
        });
        $("#contain-option-ward").text("");
        $("#contain-option-ward").append(ward);
    }
})

$(".contain-add-map").click(() => {
    $(".contain-form-adjust-address").css("display", "block");
    $(".available-address").css("display", "none");
    $(".default-address").css("display", "none");
    $("#submit-add-address-customer").css("display", "block");
    $("#submit-adjust-address-customer").css("display", "none");
    $("#submit-none-address-customer").css("display", "block");


    $("#submit-add-address-customer").click((e)=>{
        e.preventDefault()
        let cityValue = $("#contain-option-city").val()
        let districtValue = $("#contain-option-district").val()
        let wardValue = $("#contain-option-ward").val()
        let descriptionValue = $("#contain-option-description").val()

        $.ajax(
            {url: `/project_war/adress`,
                type: 'POST',
                data:{
                    "city": cityValue,
                    "district": districtValue,
                    "ward": wardValue,
                    "description": descriptionValue
                },
                success: function(result){
                    if (result == "true") {
                        alert("ok")
                    }
                    else {
                        alert(false)
                    }
                }
            }
        );
    })
});

$("#nav-map-customer").click((e)=>{
    e.preventDefault()
    $("#nav-bank-customer").removeClass("customer-category-after-click");
    $("#nav-map-customer").removeClass("customer-category-after-click");
    $("#nav-password-customer").removeClass("customer-category-after-click");
    $("#nav-favorite-customer").removeClass("customer-category-after-click");
    $("#nav-history-customer").removeClass("customer-category-after-click");
    $("#bank-customer").css("display", "none");
    $("#map-customer").css("display", "none");
    $("#password-customer").css("display", "none");
    $("#history-customer").css("display", "none");
    $("#favorite-customer").css("display", "none")
    $.ajax(
        {
            url: `/project_war/getAddress`,
            type: 'POST',
            success: function (result) {
                let arrAddress = JSON.parse(result)
                console.log(arrAddress)
                let re = ""

                for(var k in arrAddress) {
                    let cityName = renderCity(arrAddress[k].city)
                    let districtName = renderDistrict(arrAddress[k].district)
                    let wardName = renderWard(arrAddress[k].ward)
                    let descriptionName = arrAddress[k].description
                    re += ` <div class="available-address">
                            <p style="color: black;margin: 10px 0;" id="address-detail-`+arrAddress[k].id+`"><span style="color: rgb(70, 67, 67);">Địa chỉ :
                                    </span>`+ cityName+` / `+ districtName +` / `+ wardName + ` / `+ descriptionName + `</p>
                            <div>
                                <i class="fa-solid fa-pen-to-square edit-address" data-city="`+arrAddress[k].city+`" data-district="`+arrAddress[k].district+`" data-ward="`+arrAddress[k].ward+`" data-description="`+descriptionName+`" data-address="`+arrAddress[k].id+`" data-detail="`+arrAddress[k].id+`"></i>
                                <i class="fa-solid fa-trash-can delete-address" data-address="`+arrAddress[k].id+`" ></i>
                            </div>
                        </div>`
                }
                $(".contain-available-address").append(re)
                $(".edit-address").each(function(){
                    $(this).click(()=>{
                        $(".contain-form-adjust-address").css("display", "block");
                        $(".default-address").css("display", "none");
                        $(".available-address").css("display", "none");
                        $("#submit-adjust-address-customer").css("display", "block")
                        $("#submit-add-address-customer").css("display", "none")
                        $("#contain-option-city").val($(this).data("city")).change()
                        $("#contain-option-district").val($(this).data("district")).change()
                        $("#contain-option-ward").val($(this).data("ward")).change()
                        $("#contain-option-description").val($(this).data("description"))

                        $("#submit-adjust-address-customer").click((e)=>{
                            e.preventDefault()
                            let idAddress = $(this).data("address")
                            let cityValue = $("#contain-option-city").val()
                            let districtValue = $("#contain-option-district").val()
                            let wardValue = $("#contain-option-ward").val()
                            let descriptionValue = $("#contain-option-description").val()
                            let detail = $(this).data("detail")
                            alert(idAddress + "~" + cityValue +"~~"+ districtValue + "~~~" +wardValue+"~~~~"+descriptionValue)
                            $.ajax(
                                {
                                    url: `/project_war/editAddress`,
                                    type: 'POST',
                                    data:{
                                        "idAddress":idAddress,
                                        "idCity": cityValue,
                                        "idDistrict": districtValue,
                                        "idWard": wardValue,
                                        "description": descriptionValue
                                    },
                                    success: function(result){
                                        if (result =="true") {
                                            alert("~"+detail)
                                            $("#address-detail-"+detail).text(cityValue+` / `+ districtValue +` / `+ wardValue + ` / `+ descriptionValue)
                                        }
                                        else {
                                            alert(false)
                                        }
                                    }
                                }
                            );
                        })
                    })
                })
                $(".delete-address").each(function (){
                    $(this).click(()=>{
                        console.log(arrAddress[k].id)
                        $.ajax(
                            {url: `/project_war/deleteAddress`,
                                type: 'POST',
                                data:{
                                    "idAddress": $(this).data("address")
                                },
                                success: function(result){
                                    if (result == "true") {
                                        $(this).remove()
                                        alert("ok")
                                    }
                                    else {
                                        alert("false")
                                    }
                                }
                            }
                        );

                    })
                })
            }
        }
    );
})

