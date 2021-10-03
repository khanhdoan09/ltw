// search at top
function searchPopular() {
    $(".input-text-search-top").click(()=>{
        $(".contain-search-popular").css("display", "flex");
    });
    $(".contain-search-popular").mouseleave(()=>{
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
