app = angular.module("admin-app", ["ngRoute"]);

app.config(function ($routeProvider) {
    $routeProvider
        .when("/product", {
            templateUrl: "/assets/admin/product/index.html",
            control: "product-ctrl"
        })
        .when("/user", {
            templateUrl: "/assets/admin/user/index.html",
            control: "user-ctrl"
        })
        .when("/category", {
            templateUrl: "/assets/admin/category/index.html",
            control: "cate-ctrl"
        })
        .when("/authorize", {
            templateUrl: "/assets/admin/authority/index.html",
            control: "authority-ctrl"
        })
        .when("/unauthorize", {
            templateUrl: "/assets/admin/authority/unauthorize.html",
            control: "authority-ctrl"
        })
        .otherwise({
            template: "FPT Polytechnic"
        });
});
