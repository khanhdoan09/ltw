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

function displayMenuNavigation() {
    let content = `<div class="nav-inner">
                        
                            <div class="navbar-collapse" style="background-color: #0f6cb2;">
                                <ul class="main-navigation">
                                    <li><a href="index.jsp" style="color: white" class="parent" id="home-nav">TRANG CHỦ</a> </li>
                                    <li style="position: relative">
                                    <a href="ServletTest123?categoryGender=Man" style="color: white" class="parent category-item" id="category-man">
                                     NAM
                                     <i class="fas fa-caret-down"></i> 
                                     </a>
                                    
                                    <ul class="man-category" style="background-color: #0f6cb2; border:none; position:absolute; top: 35px;left:-15px;">
                                  <li id="running-man"  class="category-product category-product-man" style="color: white">
                                    <a href="ServletTest123?categoryOnNav=Running Man&pagination=1" class="link-navigation">Runnings</a>
                                    </li>
                                    <li id="slides-man"  class="category-product category-product-man" style="color: white">
                                    <a href="ServletTest123?categoryOnNav=Slides Man&pagination=1" class="link-navigation">Slides</a>
                                    </li>
                                    <li id="sneakers-man"  class="category-product category-product-man" style="color: white">
                                    <a href="ServletTest123?categoryOnNav=Sneakers Man&pagination=1" class="link-navigation">Sneakers</a>
                                    </li>
                                    <li id="skateboard-man"  class="category-product category-product-man" style="color: white">
                                    <a href="ServletTest123?categoryOnNav=Skateboard Man&pagination=1" class="link-navigation">SkateBoard</a>
                                    </li>
                                </ul>
                            
                                </li>
                                    <li style="position: relative"><a href="ServletTest123?categoryGender=Woman" style="color: white" class="parent category-item" id="category-woman">NỮ <i class="fas fa-caret-down"></i></a>
                                    
                                    <ul class="woman-category" style="background-color: #0f6cb2; border:none; position:absolute; top: 35px;left: -15px">
                                    <li id="hitops-woman" class="category-product category-product-woman" style="color: white">HiTops</li>-->
                                    <li id="running-woman"  class="category-product category-product-woman" style="color: white">
                                     <a href="CategoryProduct?category=Running Woman&categoryGender=description&pagination=1" class="link-navigation">Running</a>
                                    </li>
</li>
                                    <li id="slides-woman"  class="category-product category-product-woman" style="color: white">
                                     <a href="CategoryProduct?category=Slides Woman&categoryGender=description&pagination=1" class="link-navigation">Slides</a>
                                    </li>
</li>
                                    <li id="sneakers-woman"  class="category-product category-product-woman" style="color: white">
                                     <a href="CategoryProduct?category=Sneakers Woman&categoryGender=description&pagination=1" class="link-navigation">Sneakers</a>
                                    </li>
</li>
                                    <li id="skateboard-woman"  class="category-product category-product-woman"style="color: white" >
                                     <a href="CategoryProduct?category=Skateboard Woman&categoryGender=description&pagination=1" class="link-navigation">Skateboard</a>
                                    </li>
</li>
                                </ul>

                                    </li>
                                     <li><a href="category.html" style="color: white" class="parent category-item" id="category-brand">NHÃN HÀNG <i class="fas fa-caret-down"></i></a></li>
                                    <li><a href="blog.html" style="color: white" class="parent" id="blog-nav">BLOG</a></li>
                                    <li><a href="about-us.html" style="color: white"  id="about-nav" >VỀ CHÚNG TÔI</a></li>
                                </ul>
                                <div class="nav-detail-info">
                
         <div class="item-nav-detail-info" id="item-category-brand">
                                        <div class="contain-brand" >
                                           <img onclick="location.href='ServletTest123?brand=ASICS&pagination=1'" src="image/brand/logo-brand-01.svg">
                                            <img onclick="location.href='ServletTest123?brand=ADIDAS'" src="image/brand/logo-brand-02.svg">
                                            <img onclick="location.href='CategoryProduct?category=VANS&categoryGender=brand&pagination=1'" src="image/brand/logo-brand-03.jpg">
                                            <img onclick="location.href='CategoryProduct?category=NIKE&categoryGender=brand&pagination=1'" src="image/brand/logo-brand-04.svg">
                                            <img onclick="location.href='CategoryProduct?category=REEBOK&categoryGender=brand&pagination=1'" src="image/brand/logo-brand-05.svg">
                                            <img onclick="location.href='CategoryProduct?category=NEW BALANCE&categoryGender=brand&pagination=1'" src="image/brand/logo-brand-06.svg">
                                            <img onclick="location.href='CategoryProduct?category=ON RUNNING&categoryGender=brand&pagination=1'" src="image/brand/logo-brand-07.jpg">
                                            <img onclick="location.href='CategoryProduct?category=UNDER ARMOUR&categoryGender=brand&pagination=1'" src="image/brand/logo-brand-08.svg">
                                        </div>
                                   </div>
        
                             </div>
                            </div>
                         </div>`;
    $("#menu-navigation").append(content);
};

$(displayMenuNavigation);


$(function() {
    let curPage = window.location.pathname;
    // return page
    if (curPage.includes("index")) {
        localStorage.setItem("nav-current", "home")
    }

    if (curPage.includes("blog")) {
        localStorage.setItem("nav-current", "blog")
    }

    if (curPage.includes("category")) {
        if (localStorage.getItem("currentPageCategory") === "man")
            localStorage.setItem("nav-current", "category-man")
        else
            localStorage.setItem("nav-current", "category-woman")

    }

    if (curPage.includes("about")) {
        localStorage.setItem("nav-current", "about")
    }

    // choose page
    $("#home-nav").click(()=>{
        localStorage.setItem("nav-current", "home")
    })
    $("#category-man").click(()=>{
        localStorage.setItem("nav-current", "category-man")
        $("#category-man").addClass("active-nav")
    })
    $("#category-woman").click(()=>{
        localStorage.setItem("nav-current", "category-woman")
        $("#category-man").addClass("active-nav")
    })
    $("#blog-nav").click(()=>{
        localStorage.setItem("nav-current", "blog")
        $("#blog-nav").addClass("active-nav")
    })
    $("#about-nav").click(()=>{
        localStorage.setItem("nav-current", "about")
        $("#about-nav").addClass("active-nav")
    })
})

$(function() {
    if (localStorage.getItem("nav-current")==="home") {
        $("#home-nav").addClass("active-nav")
    }

    if (localStorage.getItem("nav-current")==="category-man") {
        $("#category-man").addClass("active-nav")
    }
    if (localStorage.getItem("nav-current")==="category-woman") {
        $("#category-woman").addClass("active-nav")
    }
    if (localStorage.getItem("nav-current")==="blog") {
        $("#blog-nav").addClass("active-nav")
    }
    if (localStorage.getItem("nav-current")==="about") {
        $("#about-nav").addClass("active-nav")
    }
})



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


let listProduct = [
    {brand:"Nike", name:"Air Force One 1", saleRate:"20",oldPrice:"1.200.000", newPrice:"1.000.000",linkImg:"image/product/product-01.jpg"},
    {brand:"Nike", name:"Phantom GT Elite Firm Ground Football Boots Juniors", saleRate:"25",oldPrice:"1.900.000", newPrice:"800.000",linkImg:"image/product/product-02.jpg"},
    {brand:"Nike", name:"Air Force One 1", saleRate:"20",oldPrice:"1.200.000", newPrice:"1.500.000",linkImg:"image/product/product-03.webp"},
    {brand:"Nike", name:"Air Force One 1", saleRate:"30",oldPrice:"2.200.000", newPrice:"1.900.000",linkImg:"image/product/product-04.webp"},
    {brand:"Nike", name:"Air Force One 1", saleRate:"15",oldPrice:"3.200.000", newPrice:"2.200.000",linkImg:"image/product/product-05.webp"},
    {brand:"Nike", name:"Air Force One 1", saleRate:"10",oldPrice:"2.200.000", newPrice:"1.800.000",linkImg:"image/product/product-06.jpg"},
    {brand:"Nike", name:"Air Force One 1", saleRate:"2",oldPrice:"3.200.000", newPrice:"1.200.000",linkImg:"image/product/product-07.webp"},
    {brand:"Nike", name:"Air Force One 1", saleRate:"12",oldPrice:"2.200.000", newPrice:"2.000.000",linkImg:"image/product/product-08.jpg"},
    {brand:"Nike", name:"Air Force One 1", saleRate:"15",oldPrice:"3.200.000", newPrice:"3.000.000",linkImg:"image/product/product-09.webp"},


]
function displayListProduct() {
    listProduct.forEach(element => {
        let contain = `<div class="product-layout product-grid col-lg-4 col-md-5 col-sm-6 col-xs-10" style="background-color: white; padding: 10px 0">
        <div class="product-thumb">
          <div class="image product-imageblock">
            <a href="product.html">
                <div class="related-product-sale">
                   <h5 style='margin-top: 10px'> -20%</h5>
                 </div>
<img id="imgCategory" src="${element.linkImg}" alt="lorem ippsum dolor dummy" title="lorem ippsum dolor dummy" class="img-responsive item-img-list" /> </a>
            <div class="button-group button-group-list-category">
            <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
            <button type="button" class="addtocart-btn">Mua Ngay</button>
            <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>            </div>
          </div>
          <div class="caption product-detail intro-product-detail-list">
         <h2 id="brandCategory" style='margin-top: 5px; text-transform: uppercase'>${element.brand}</h2>
            <h4 class="product-name">
<a id="nameCategory" href="product.html" title="lorem ippsum dolor dummy" style='text-transform: capitalize'>
${element.name}</a> </h4> 
            <p class="product-desc"> More room to move. With 80GB or 160GB of storage and up to 40 hours of battery life, the new lorem ippsum dolor dummy lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go. Cover
              Flow. Browse through your music collection by flipping..</p> 
            <p id="priceCategory" class="price product-price produce-price-list">
            <span class="price-old" style='margin-right: 10px'>${element.oldPrice} VND</span>
            ${element.newPrice} VND </p>
            <div class="rating"> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>                                    </div>
          </div>
          <div class="button-group button-group-list-category">
          <button type="button" class="wishlist" data-toggle="tooltip" title="Add to Wish List"><i class="fas fa-heart"></i></button>
          <button type="button" class="addtocart-btn">Mua Ngay</button>
          <button type="button" class="compare" data-toggle="tooltip" title="Compare this Product"><i class="fas fa-shopping-cart"></i></button>          </div>
        </div>
      </div>`;
        $(".grid-list-wrapper").append(contain);
    });


}

// to set category man or category woman
$(function () {
    $("#category-man").click(() => {
        localStorage.setItem("currentPageCategory", "man");
        localStorage.setItem("categoryByNav", "");
        $(".contain-carousel-category").css("display", "block");
        $(".grid-list-wrapper").empty();
    });
    $("#category-woman").click(() => {
        localStorage.setItem("currentPageCategory", "woman");
        localStorage.setItem("categoryByNav", "");
        $(".contain-carousel-category").css("display", "block");
        $(".grid-list-wrapper").empty();
    });
});

let listIntroCategoryMan = [];
listIntroCategoryMan.push("data/product/Shoe/HiTops/HiTopsMan.js");
listIntroCategoryMan.push("data/product/Shoe/Running/RunningMan.js");
listIntroCategoryMan.push("data/product/Shoe/Slides/SlidesMan.js");
listIntroCategoryMan.push("data/product/Shoe/Sneakers/SneakersMan.js");
listIntroCategoryMan.push("data/product/Shoe/SkateBoard/SkateBoardMan.js");
listIntroCategoryMan.push("data/product/Shoe/Football/FootballMan.js");
let listIntroCategoryWoman = [];
listIntroCategoryWoman.push("data/product/Shoe/HiTops/HiTopsWoman.js");
listIntroCategoryWoman.push("data/product/Shoe/Running/RunningWoman.js");
listIntroCategoryWoman.push("data/product/Shoe/Slides/SlidesWoman.js");
listIntroCategoryWoman.push("data/product/Shoe/Sneakers/SneakersWoman.js");
listIntroCategoryWoman.push("data/product/Shoe/SkateBoard/SkateBoardWoman.js");
listIntroCategoryWoman.push("data/product/Shoe/Football/FootballWoman.js");




function loadImageCarouselAndIntroduceCategory() {
    if (localStorage.getItem("currentPageCategory") == "man") {
        $("#category-carousel-intro-1").attr("src", "image/banners/men-intro-carousel1.webp");
        $("#category-carousel-intro-2").attr("src", "image/banners/men-intro-carousel2.webp");
        $("#category-carousel-intro-3").attr("src", "image/banners/men-intro-carousel-3.jpg");
        $("#category-intro-img-hitops").attr("src", "image/category/man-Hitops.webp");
        $("#category-intro-img-running").attr("src", "image/category/man-running.webp");
        $("#category-intro-img-slides").attr("src", "image/category/man-slides.jpg");
        $("#category-intro-img-football").attr("src", "image/category/man-football.webp");
        $("#category-intro-img-sneakers").attr("src", "image/category/man-sneakers.jpg");
        $("#category-intro-img-skateboard").attr("src", "image/category/man-skateboard.jpg");
    }
    else {
        $("#category-carousel-intro-1").attr("src", "image/banners/women-intro-carousel1.webp");
        $("#category-carousel-intro-2").attr("src", "image/banners/women-intro-carousel2.webp");
        $("#category-carousel-intro-3").attr("src", "image/banners/women-intro-carousel3.webp");
        $("#category-intro-img-hitops").attr("src", "image/category/woman-hitops.jpg");
        $("#category-intro-img-running").attr("src", "image/category/running-woman.webp");
        $("#category-intro-img-slides").attr("src", "image/category/woman-slide.jpg");
        $("#category-intro-img-football").attr("src", "image/category/woman-football.jfif");
        $("#category-intro-img-sneakers").attr("src", "image/category/woman-sneakers.webp");
        $("#category-intro-img-skateboard").attr("src", "image/category/woman-skateboard.jfif");
    }
}
$(window).ready(loadImageCarouselAndIntroduceCategory);



function displayPagination() {
    let contain = "<span>Page  </span><select id=\"selectPagination\">";
    for (let i = 1; i <= 9; i++)
        contain += `<option value="${i}">${i}</option>`
    contain += `</select> <span> of 9 </span>`;
    $(".pagination").append(`<li><a href="#" id="left-page">&lt;</a></li><li><a href="#" id="right-page">&gt;</a></li>`);
    $(".pagination").append(contain);
    $(`#selectPagination option[value=1]`).attr('selected', 'selected');
};


// access information of page costumer
function accessInfoCustomer() {
    $("#nav-info-customer").click(() => {
        resetAllSectionCustomer();
        $("#info-customer").css("display", "block");
        $("#nav-info-customer").addClass("customer-category-after-click");
        $("#info-customer").addClass("display-default-customer")
    });

    $("#nav-favorite-customer").click(() => {
        resetAllSectionCustomer();
        $("#favorite-customer").css("display", "flex");
        $("#nav-favorite-customer").addClass("customer-category-after-click");
        removeDefaultNavContentCategory()
    });

    $("#nav-bank-customer").click(() => {
        resetAllSectionCustomer();
        $("#bank-customer").css("display", "block");
        $("#nav-bank-customer").addClass("customer-category-after-click");
        removeDefaultNavContentCategory()
    });
    $("#nav-map-customer").click(() => {
        resetAllSectionCustomer();
        $("#map-customer").css("display", "block");
        $("#nav-map-customer").addClass("customer-category-after-click");
        removeDefaultNavContentCategory()
    });
    $("#nav-password-customer").click(() => {
        resetAllSectionCustomer();
        $("#password-customer").css("display", "block");
        $("#nav-password-customer").addClass("customer-category-after-click");
        removeDefaultNavContentCategory()
    });

    $("#nav-history-customer").click(() => {
        resetAllSectionCustomer();
        $("#history-customer").css("display", "block");
        $("#nav-history-customer").addClass("customer-category-after-click");
        $("#info-customer").css("display", "none");
    });

    $(".adjust-address-customer").click(() => {
        $(".contain-form-adjust-address").css("display", "block");
        $(".default-address").css("display", "none");
        $(".available-address").css("display", "none");
        $("#submit-adjust-address-customer").val("Chỉnh sửa");
    });

    $(".contain-add-map").click(() => {
        $(".contain-form-adjust-address").css("display", "block");
        $(".available-address").css("display", "none");
        $("#submit-adjust-address-customer").val("Thêm");
        $(".default-address").css("display", "none");
    });

    $("#submit-adjust-address-customer").click(() => {
        $(".contain-form-adjust-address").css("display", "none");
        $(".available-address").css("display", "block");
        $(".default-address").css("display", "block");
    });
    $("#delete-adjust-address-customer").click(() => {
        $(".contain-form-adjust-address").css("display", "none");
        $(".available-address").css("display", "block");
        $(".default-address").css("display", "block");
    });
}

function resetAllSectionCustomer() {
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

}
$(window).ready(resetAllSectionCustomer);

function removeDefaultNavContentCategory() {
    $("#nav-info-customer").removeClass("customer-category-after-click");
    $("#info-customer").css("display", "none");
}
$(window).ready(accessInfoCustomer);

// load location customer
$(function () {
    loadDefaultLocation();
    $('#contain-option-city').on('change', function () {
        let cityCode = $(this).val();
        loadDistrict(cityCode);
        let codeFirstDistrict = "";
        for (let i = 0; i < districts.length; i++) {
            if (districts[i].parent_code == cityCode) {
                codeFirstDistrict = districts[i].code;
                break;
            }
        }
        loadWard(codeFirstDistrict);
    });

    $('#contain-option-district').on('change', function (e) {
        let districtCode = $(this).val();
        loadWard(districtCode);
    });
});

function loadDefaultLocation() {
    loadCity();
    loadDistrict(89,);
    loadWard(883);
}

function loadCity() {
    let location = new XMLHttpRequest();
    location.open("GET", "data/location/city.js");
    location.send();
    location.onload = function () {
        let cities = JSON.parse(location.responseText);
        let city = "";
        cities.forEach((element) => {
            city += "<option value=\"" + element.code + "\"" + "class=\"city\">" + element.name + "</option>\n";
        });
        $("#contain-option-city").append(city);
    }
}

function loadDistrict(districtCode) {
    let location = new XMLHttpRequest();
    location.open("GET", "data/location/district.js");
    location.send();
    location.onload = function () {
        let data = JSON.parse(location.responseText);
        districtArr = data.filter((value) => value.parent_code == districtCode);
        let district = "";
        districtArr.forEach((element) => {
            district += "<option value=\"" + element.code + "\"" + "class=\"district\">" + element.name + "</option>\n";
        });
        $("#contain-option-district").text("");
        $("#contain-option-district").append(district)
    }
}

function loadWard(wardCode) {
    let location = new XMLHttpRequest();
    location.open("GET", "data/location/ward.js");
    location.send();
    location.onload = function () {
        let data = JSON.parse(location.responseText);
        let wardArr = data.filter((value) => value.parent_code == wardCode);
        let ward = "";
        wardArr.forEach((element) => {
            ward += "<option value=\"" + element.code + "\"" + "class=\"ward\">" + element.name + "</option>\n";
        });
        $("#contain-option-ward").text("");
        $("#contain-option-ward").append(ward);
    }
}

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


$(function() {
    $("#button-search-header").click((e)=>{
        e.preventDefault()
        let url = "ServletTest123?"
        url += "input-search-header=" + $("#input-search-header").val() + "&"
        url += "pagination=1"
        $('#form-header-search').attr('action', url);
        $('#form-header-search').submit()
    })
})

$(function () {
    $("#input-search-header").on("input", function(e) {
        let word = $(this).val();
        let xhttp = new XMLHttpRequest();
        //  onreadystatechange này sẽ được kích hoạt mỗi khi trạng thái readyState thay đổi -- readyState:thuộc tính này định nghĩa trạng thái hiện tại của đối tượng XMLHttpRequest.
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) { //HTTP REPONSE => 4=DONE:The operation is complete 200=SUCCESS
                getDataFromServlet(xhttp)
            }
        };
        xhttp.open("POST", `ServletTest123?wordSearchHeader=${word}`, true);
        xhttp.send();
    });

})

function getDataFromServlet(xhttp) {
    let data = xhttp.responseText.split("\n")
    $(".contain-search-popular").empty()
    data.forEach((value)=>{
        let item = value.split("@@##**") // to split id and name
        $(".contain-search-popular").append(`<span onclick="location.href='ProductDetail?idProduct=${item[0]}'">${item[1]}</span><br/>`)
    })
}



let arrDataProductInAdmin = ""

$(function() {
    $('.admin-product-order').on("click", function (event) {
        event.preventDefault();

        if ($(this).is('.clicked')) {
            $(this).removeClass('clicked');
        }
        else {
            $('.admin-product-order').removeClass("clicked") // down
            $(this).addClass('clicked'); // up
        }

        let url = this.href;
        $.ajax({
            url: url,
            type: 'POST',
            success: function (data) {
                let arr = JSON.parse(data);
                let re = ""
                arrDataProductInAdmin = arr
                arr.forEach((e) => {
                    re += `<tr>
                                        <td><strong>${e.id}</strong></td>
                                        <td><img src="assets/images/product/product-02.jpg" class="avatar lg rounded me-2" alt="profile-image"></td>
                                        <td>${e.name}</td>
                                        <td>${e.brand}</td>
                                        <td>May 16, 2021</td>
                                        <td>${e.value}</td>
                                        <td>-${e.saleRate}</td>
                                        <td>
                                            <a class="edit-remove-admin remove-admin"
                                            data-id="${e.id}"><i class="fas fa-trash-alt" data-id="${e.id}"></i></a>
                                               <a class="edit-remove-admin edit-admin" href="EditProduct.jsp">
                                            <i class="fas fa-edit"></i></a>
                                        </td>
                                    </tr>`
                })
                $("#listProduct").empty()
                $("#listProduct").append(re)
                removeProductInAdmin()
            },
            error: function () {
                $('#notification-bar').text('An error occurred');
            },
            async: false
        });

    });
})


function promiseRemove(id) {
    return new Promise((resolve, reject)=>{
        let bol = false
        if (bol)
            reject("error by reject promise" + id)
        else
            resolve(id)
    })
}

function removeProductInAdmin() {
    $(".remove-admin").each(function (index) {
        $(this).click(() => {
            let data = $(this).data("id")
            alert(`Are you sure wanna delete this ${data}`)
            $(`#tr-product-${data}`).empty()
            $.ajax({
                url: `ListProductAdmin?removeProduct="${data}"`,
                type: 'POST',
                success: function (data) {
                    alert(data)
                },
                error: function() {
                  alert("Error")
                }
            })
        });
    })
}
$(window).ready(removeProductInAdmin)


let paginationProductInAdmin = 0
$(function() {
    $("#load-more-product").click(()=>{
        let type = $("#type-product-admin").val()
        let name = $("#input-name-product-admin").val()
        paginationProductInAdmin += 1

        $.ajax({
            url: `ListProductAdmin?type=${type}&name=${name}&pagination=${paginationProductInAdmin}`,
            type: 'POST',
            success: function (data) {
                    if (data==='no more data') {
                        $("#load-more-product").remove()
                    }
                    else {
                        let arr = JSON.parse(data);
                        let re = ""
                        arr.forEach((e) => {
                            re += `<tr id='tr-product-${e.id}'>
                                        <td><strong>${e.id}</strong></td>
                                        <td><img src="assets/images/product/product-02.jpg" class="avatar lg rounded me-2" alt="profile-image"></td>
                                        <td>${e.name}</td>
                                        <td>${e.brand}</td>
                                        <td>May 16, 2021</td>
                                        <td>${e.value}</td>
                                        <td>-${e.saleRate}</td>
                                        <td>
                                            <a class="edit-remove-admin remove-admin"
                                            data-id="${e.id}"><i class="fas fa-trash-alt" data-id="${e.id}"></i></a>
                                            <a class="edit-remove-admin edit-admin" href="EditProduct?id=${e.id}>"><i class="fas fa-edit"></i></a>
                                        </td>
                                    </tr>`
                        })
                        $("#listProduct").append(re)
                    }
                removeProductInAdmin()
            },
            error: function () {
                $('#notification-bar').text('An error occurred');
            }
        });

    })})

/*
$(function() {
$("#submit-admin").click((e)=>{
    e.preventDefault()
    let type = $("#type-product-admin").val()
    let name = $("#input-name-product-admin").val()

    $('#form-product-admin').attr('action', `ListProduct?type=${type}&name=${name}&pagination=1`);
    $.ajax({
        url: `ListProduct?type=${type}&name=${name}&pagination=1`,
        type: 'POST',
        success: function (data) {
            let arr = JSON.parse(data);
            let re = ""
            arrDataProductInAdmin = arr
            console.log(456)
            localStorage.setItem("dataProductInAdmin", data)
            console.log(localStorage.getItem("dataProductInAdmin") + 123)
            arr.forEach((e) => {
                re += `<tr>
                                        <td><strong>${e.id}</strong></td>
                                        <td><img src="assets/images/product/product-02.jpg" class="avatar lg rounded me-2" alt="profile-image"></td>
                                        <td>${e.name}</td>
                                        <td>${e.brand}</td>
                                        <td>May 16, 2021</td>
                                        <td>${e.value}</td>
                                        <td>-${e.saleRate}</td>
                                        <td>
                                            <a class="edit-remove-admin remove-admin"
                                            data-id="${e.id}"><i class="fas fa-trash-alt" data-id="${e.id}"></i></a>
                                            <a class="edit-remove-admin remove-admin"><i class="fas fa-edit"></i></a>
                                        </td>
                                    </tr>`
            })

            $("#listProduct").empty()
            $("#listProduct").append(re)
            removeProductInAdmin()
            pagination += 1
            window.location.href = `order-invoices.jsp?type=${type}&pagination=1`;

        },
        error: function () {
            $('#notification-bar').text('An error occurred');
        }
    });

        $("#form-product-admin").submit()


})
})

$(function() {
    let data = localStorage.getItem("dataProductInAdmin")
    if (data != null) {
        let re = ""
        let arr = JSON.parse(data)
        arrDataProductInAdmin = arr
        arr.forEach((e) => {
            re += `<tr>
                                        <td><strong>${e.id}</strong></td>
                                        <td><img src="assets/images/product/product-02.jpg" class="avatar lg rounded me-2" alt="profile-image"></td>
                                        <td>${e.name}</td>
                                        <td>${e.brand}</td>
                                        <td>May 16, 2021</td>
                                        <td>${e.value}</td>
                                        <td>-${e.saleRate}</td>
                                        <td>
                                            <a class="edit-remove-admin remove-admin"
                                            data-id="${e.id}"><i class="fas fa-trash-alt" data-id="${e.id}"></i></a>
                                            <a class="edit-remove-admin remove-admin"><i class="fas fa-edit"></i></a>
                                        </td>
                                    </tr>`
        })
        $("#listProduct").empty()
        $("#listProduct").append(re)
        removeProductInAdmin()
        ttt()
        loadMore()
    }
    else {
        alert("data null")
    }
})


function loadMore(){
    $("#load-more-product").click(()=>{
        let type = $("#type-product-admin").val()
        let name = $("#input-name-product-admin").val()
        pagination += 1

        $.ajax({
            url: `ListProduct?type=${type}&name=${name}&pagination=${pagination}`,
            type: 'POST',
            success: function (data) {
                let arr = JSON.parse(data);
                let re = ""
                arrDataProductInAdmin += arr
                localStorage.setItem("dataProductInAdmin",  arrDataProductInAdmin)

                arr.forEach((e) => {
                    re += `<tr>
                                        <td><strong>${e.id}</strong></td>
                                        <td><img src="assets/images/product/product-02.jpg" class="avatar lg rounded me-2" alt="profile-image"></td>
                                        <td>${e.name}</td>
                                        <td>${e.brand}</td>
                                        <td>May 16, 2021</td>
                                        <td>${e.value}</td>
                                        <td>-${e.saleRate}</td>
                                        <td>
                                            <a class="edit-remove-admin remove-admin"
                                            data-id="${e.id}"><i class="fas fa-trash-alt" data-id="${e.id}"></i></a>
                                            <a class="edit-remove-admin remove-admin"><i class="fas fa-edit"></i></a>
                                        </td>
                                    </tr>`
                })

                $("#listProduct").append(re)
                removeProductInAdmin()

            },
            error: function () {
                $('#notification-bar').text('An error occurred');
            }
        });

    console.log(pagination)
    })
}

*/

