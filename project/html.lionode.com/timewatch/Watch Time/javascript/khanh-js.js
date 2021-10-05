// search at top
function searchPopular() {
    $(".input-text-search-top").click(()=>{
        $(".contain-search-popular").css("display", "flex");
    });
    $(".contain-search").mouseleave(()=>{
        $(".contain-search-popular").css("display", "none");
    });
}

$(window).ready(searchPopular, dropdownLocate);

// dropdown
function dropdownLocate() {
    $(".open-dropdown-locate").click(()=>{
        $(".dropdown-locate").css("display", "inline");
        $(".open-dropdown-locate").css("display", "none");
        $(".close-dropdown-locate").css("display", "inline");
        $(".contain-dropdown-locate").css("height", "550px");
    });

    $(".close-dropdown-locate").click(()=>{
        $(".dropdown-locate").css("display", "none");
        $(".open-dropdown-locate").css("display", "inline");
        $(".close-dropdown-locate").css("display", "none");
        $(".contain-dropdown-locate").css("height", "330px");
    });
}

$(window).ready(dropdownLocate);



function changeCategoryNav() {
    $(".category-football").mouseover(()=>{
        setUpCategoryNav();
        $("#item-category-football").css("display", "flex");
    });
    $(".category-gym").mouseover(()=>{
        setUpCategoryNav();
        $("#item-category-gym").css("display", "flex");
    });
    $(".category-running").mouseover(()=>{
        setUpCategoryNav();
        $("#item-category-running").css("display", "flex");
    });
    $(".category-brand").mouseover(()=>{
        setUpCategoryNav();
        $("#item-category-brand").css("display", "flex");
    });

    $(".nav-detail-info").mouseover(()=>{
        $(".nav-detail-info").css("display", "grid");
    });

    $(".navbar-collapse").mouseout(()=>{
        $(".nav-detail-info").css("display", "none");
    });
}
function setUpCategoryNav() {
    $(".nav-detail-info").css("display", "grid");
    $("#item-category-gym").css("display", "none");
    $("#item-category-football").css("display", "none")
    $("#item-category-running").css("display", "none");
    $("#item-category-brand").css("display", "none");
}

$(window).ready(changeCategoryNav);