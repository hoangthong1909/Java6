app.controller("order-ctrl", function($scope, $http,$location){
    $scope.items = [];
    $scope.detail = [];
    $scope.ok='OK';
    $scope.datalists=[];
    $scope.numPagesInt=0;

    $scope.getAll = function () {
        $http.get(`/rest/orders`).then(resp => {
            $scope.items = resp.data;
            $scope.datalists=resp.data;
            $scope.itemsIndex = [];
            for (i = 1; i <= Math.ceil($scope.datalists.length/5); i++) {
                $scope.itemsIndex.push({text: 'itemsIndex ' + i, done: false});
            }
        })
    }

    $scope.getAll();
    $scope.view = function(item){
        $http.get(`/rest/orders/user/${item.id}`).then(resp => {
            $scope.detail = resp.data;
            console.log($scope.detail)
        })
    }
    $scope.delete = function(item){
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
                $http.delete(`/rest/orders/${item.id}`).then(resp=>{
                    var index = $scope.items.findIndex(p=>p.id==item.id);
                    $scope.items.splice(index,1);
                    Swal.fire(
                        'Xóa Thành Công!',
                        'Your file has been deleted!',
                        'success'
                    )
                }).catch(e=>{
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
    $scope.confirm = function(item){
        Swal.fire({
            title: 'Xác nhận đơn hàng?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Confirm!'
        }).then((result) => {
            if (result.isConfirmed) {
                $http.put(`/rest/orders/confirm/${item.id}`,item).then(resp=>{
                    var index = $scope.items.findIndex(p=>p.id==item.id);
                    $scope.items[index] = item
                    Swal.fire(
                        'Xác nhận Thành Công!',
                        'Your file has been deleted!',
                        'success'
                    )
                }).catch(e=>{
                    Swal.fire(
                        'Xác nhận thất bại!',
                        'You clicked the button!',
                        'error'
                    )
                    console.log(e);
                })
            }
        })
    }
    $scope.cancel = function(item){
        Swal.fire({
            title: 'Bạn chắc chắn muốn hủy đơn hàng?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes!'
        }).then((result) => {
            if (result.isConfirmed) {
                $http.put(`/rest/orders/cancel/${item.id}`,item).then(resp=>{
                    var index = $scope.items.findIndex(p=>p.id==item.id);
                    $scope.items[index] = item
                    Swal.fire(
                        'Hủy đơn hàng Thành Công!',
                        'Your file has been deleted!',
                        'success'
                    )
                }).catch(e=>{
                    Swal.fire(
                        'Hủy đơn hàng thất bại!',
                        'You clicked the button!',
                        'error'
                    )
                    console.log(e);
                })
            }
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
