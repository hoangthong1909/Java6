app.controller("product-ctrl", function ($scope, $http) {
    $scope.numPagesInt=0;
    $scope.datalists=[];
    $scope.items = [];
    $scope.cates = [];
    $scope.form = {
        createDate: new Date(),
        image: 'upload.jpg',
        available: 1
    }
    $scope.index = -1;
    $scope.getAll = function (){
        $http.get("/rest/products").then(resp => {
            $scope.items = resp.data;
            $scope.datalists=resp.data;
            $scope.itemsIndex = [];
            for (i = 1; i <= Math.ceil($scope.datalists.length/5); i++) {
                $scope.itemsIndex.push({text: 'itemsIndex ' + i, done: false});
            }
            $scope.items.forEach(item => {
                item.createDate = new Date(item.createDate);
            })
        });
        $http.get("/rest/category").then(resp => {
            $scope.cates = resp.data;
        });
    }

    $scope.getAll();
    $scope.create = function () {
        var item = angular.copy($scope.form);
        console.log(JSON.stringify(item))
        $http.post(`/rest/products`, item).then(resp => {
            resp.data.createDate = new Date(resp.data.createDate)
            $scope.items.push(resp.data);
            $scope.reset();
            Swal.fire(
                'Thêm mới thành công!',
                'You clicked the button!',
                'success'
            )
            $(".nav-tabs a:eq(1)").tab('show')
        }).catch(error => {
            Swal.fire(
                'Thêm mới thất bại!',
                'You clicked the button!',
                'error'
            )
            console.log(error);
        });
    }
    $scope.update = function () {
        var item = angular.copy($scope.form);
        $http.put(`/rest/products/${item.id}`, item).then(resp => {
            var index = $scope.items.findIndex(p => p.id == item.id);
            $scope.items[index] = item;
            Swal.fire(
                'Cập nhật thành công!',
                'You clicked the button!',
                'success'
            )
            $(".nav-tabs a:eq(1)").tab('show')
        }).catch(e => {
            Swal.fire(
                'Cập nhật thất bại!',
                'You clicked the button!',
                'error'
            )
            console.log(e);
        })
    }
    $scope.delete = function (item) {
        Swal.fire({
            title: 'Bạn chắc chắn muốn xóa?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $http.delete(`/rest/products/${item.id}`).then(resp => {
                    var index = $scope.items.findIndex(p => p.id == item.id);
                    $scope.items.splice(index, 1);
                    $scope.reset();
                    Swal.fire(
                        'Xóa Thành Công!',
                        'You clicked the button!',
                        'success'
                    )
                    $(".nav-tabs a:eq(1)").tab('show')
                }).catch(e => {
                    Swal.fire(
                        'Xóa thất bại!',
                        'You clicked the button!',
                        'error'
                    )
                    console.log(e);
                })
            }
        })
    }
    $scope.reset = function () {
        $scope.form = {
            createDate: new Date(),
            image: 'upload.jpg',
            available: 1
        }
        $scope.index = -1;
    }
    $scope.edit = function (item) {
        $scope.form = angular.copy(item);
        $scope.index = item;
        $(".nav-tabs a:eq(0)").tab('show')
    }

    $scope.imageChanged = function (files) {
        var data = new FormData();
        data.append('file', files[0]);
        $http.post('/rest/upload/images', data, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        }).then(resp => {
            $scope.form.image = resp.data.name;
        }).catch(error => {
            Swal.fire(
                'Upload Failed!',
                'You clicked the button!',
                'error'
            )
            console.log(error);
        })
    }
    $scope.curPage = 0;
    $scope.pageSize = 5;
    $scope.numberOfPages = function() {
        return Math.ceil($scope.datalists.length / $scope.pageSize);
    };
    $scope.makeTodos = function () {
        $scope.todos = [];
        for (i = 1; i <= 1000; i++) {
            $scope.todos.push({text: 'todo ' + i, done: false});
        }
    };
    $scope.makeTodos();
    $scope.numPages = function () {
        $scope.numPagesInt=Math.ceil($scope.todos.length / $scope.numPerPage);
        return Math.ceil($scope.todos.length / $scope.numPerPage);
    };
    $scope.numPages();
    $scope.$watch('currentPage + numPerPage', function () {
        var begin = (($scope.currentPage - 1) * $scope.numPerPage)
            , end = begin + $scope.numPerPage;
        $scope.items = $scope.todos.slice(begin, end);
    });

});
app.filter('startPagination', function() {
    return function(input, start) {
        start = +start;
        return input.slice(start);
    };
});



