// search at top
$(function() {
    $(".input-text-search-top").click(() => {
        $(".contain-search-popular").css("display", "flex");
    });
    $(".contain-search").mouseleave(() => {
        $(".contain-search-popular").css("display", "none");
    });
});

$(function() {
    $(".bt-nav-collapse").click(()=>{
        $(".navbar-collapse").slideToggle("slow");

    })
})
// display filter search when click {
$(function(){
    $(".toggle-filter-search").click(() => {
        $(".contain-filter-search").slideToggle("show");
    });
});


// payment method
$(function() {

    $("#payment-cod").click(()=>{
        $(".payment-input").removeClass("payment-input-active")
        $("#contain-payment-cod").addClass("payment-input-active");
    })

    $("#payment-shoppe").click(()=>{
        $(".payment-input").removeClass("payment-input-active")
        $("#contain-payment-shoppe").addClass("payment-input-active");
    })

    $("#payment-zalo").click(()=>{
        $(".payment-input").removeClass("payment-input-active")
        $("#contain-payment-zalo").addClass("payment-input-active");
    })

    $("#payment-momo").click(()=>{
        $(".payment-input").removeClass("payment-input-active")
        $("#contain-payment-momo").addClass("payment-input-active");
    })

});





// click price search in filter search
$(function() {
    $("#price-search-01").click(() => {
        if ($('#hidden-checkbox-price-1').is(':checked')) {
            $("#price-search-01").css("background-color", "grey")
        }
        else {
            $("#price-search-01").css("background-color", "#5f2525");
        }
    });
    $("#price-search-02").click(() => {
        if ($('#hidden-checkbox-price-2').is(':checked')) {
            $("#price-search-02").css("background-color", "grey")
        }
        else {
            $("#price-search-02").css("background-color", "#5f2525");
        }
    });
    $("#price-search-03").click(() => {
        if ($('#hidden-checkbox-price-3').is(':checked')) {
            $("#price-search-03").css("background-color", "grey")
        }
        else {
            $("#price-search-03").css("background-color", "#5f2525");
        }
    });
});

$(function() {
    $("#label-5-star").click(()=>{
        if ($("#filter-star-5").is(":checked")) {
            $("#label-5-star .fa-star").css("color", "yellow")
        }
        else {
            $("#label-5-star .fa-star").css("color", "grey")
        }
    })
    $("#label-4-star").click(()=>{
        if ($("#filter-star-4").is(":checked")) {
            $("#label-4-star .fa-star").css("color", "yellow")
        }
        else {
            $("#label-4-star .fa-star").css("color", "grey")
        }
    })
    $("#label-3-star").click(()=>{
        if ($("#filter-star-3").is(":checked")) {
            $("#label-3-star .fa-star").css("color", "yellow")
        }
        else {
            $("#label-3-star .fa-star").css("color", "grey")
        }
    })
})
// responsive navigation
$(function() {
    $("#category-man").mouseover(() => {
        setUpCategoryNav();
        $('.man-category').addClass('display-sub-nav');

    });
    $("#category-woman").mouseover(() => {
        setUpCategoryNav();
        $('.woman-category').addClass('display-sub-nav');
    });

    $("#category-brand").mouseover(() => {
        setUpCategoryNav();
        $("#item-category-brand").css("display", "flex");
        if ($(window).width() < 750) {
            $(".nav-detail-info").css("top", "120px");
            $(".nav-detail-info").css("left", "0px");
            $("#item-category-brand").css("width", "100%");
        }
    });

    $(".man-category").mouseover(() => {
        $('.man-category').addClass('display-sub-nav');
    });

    $(".woman-category").mouseover(() => {
        $('.woman-category').addClass('display-sub-nav');
    });

    $(".nav-detail-info").mouseover(() => {
        $(".nav-detail-info").css("display", "grid");
    });

    $(".navbar-collapse").mouseout(() => {
        $('.man-category').removeClass('display-sub-nav');
        $('.woman-category').removeClass('display-sub-nav');
        $(".nav-detail-info").css("display", "none");

    });
});

function setUpCategoryNav() {
    $(".nav-detail-info").css("display", "grid");
    $("#item-category-woman").css("display", "none");
    $("#item-category-man").css("display", "none")
    $("#item-category-running").css("display", "none");
    $("#item-category-brand").css("display", "none");
}





function displayPagination() {
    let contain = "<span>Page  </span><select id=\"selectPagination\">";
    for (let i = 1; i <= 9; i++)
        contain += `<option value="${i}">${i}</option>`
    contain += `</select> <span> of 9 </span>`;
    $(".pagination").append(`<li><a href="#" id="left-page">&lt;</a></li><li><a href="#" id="right-page">&gt;</a></li>`);
    $(".pagination").append(contain);
    $(`#selectPagination option[value=1]`).attr('selected', 'selected');
};


$(function() {
    $("#button-filter").click(()=>{
        let url = $('#form-filter-search').attr('action');

        $('#checkboxBrandFilter input[type=checkbox]').each(function() {
            if ($(this).is(":checked")) {
                url += "brand=" + $(this).val() + "&"
            }
        });
        $('.input-star').each(function() {
            if ($(this).is(":checked")) {
                url += "star=" + $(this).val() + "&"
            }
        });
        $('#checkboxPriceOrderFilter input[type=radio]').each(function() {
            if ($(this).is(":checked")) {
                url += "highestLowest=" + $(this).val() + "&"
            }
        });
        if ($("#hidden-checkbox-price-1").is(":checked")) {
            url += "underPrice=" + $("#hidden-checkbox-price-1").val() + "&"
        }
        if ($("#hidden-checkbox-price-2").is(":checked")) {
            let priceRange = $("#hidden-checkbox-price-2").val().split("&&")
            url += "fromPrice="+priceRange[0] + "&toPrice="+priceRange[1]+"&"
        }
        if ($("#hidden-checkbox-price-3").is(":checked")) {
            url += "upPrice=" + $("#hidden-checkbox-price-3").val() + "&"
        }
        if ($("#inputFilterPriceFrom").val().length !== 0 )
            url += "fromInputPrice=" + $("#inputFilterPriceFrom").val() + "&"
        if ($("#inputFilterPriceTo").val().length !== 0 )
            url += "toInputPrice=" + $("#inputFilterPriceTo").val() + "&"
        url += "pagination=1"
        $('#form-filter-search').attr('action', url);
    })
})

