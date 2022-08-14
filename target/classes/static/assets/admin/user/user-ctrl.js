app.controller("user-ctrl", function($scope, $http){
    $scope.items = [];
    $scope.form = {
        photo: 'upload.jpg',
    }
    $scope.index = -1;

    $scope.getAll = function () {
        $http.get("/rest/accounts").then(resp => {
            $scope.items = resp.data;
        });
    }

    $scope.getAll();
    $scope.pager = {
        page:0,
        size:2,
        get items(){
            var start = this.page * this.size;
            return $scope.items.slice(start,start +this.size);
        },
        get count(){
            return Math.ceil(1.0*$scope.items.length/this.size);
        },
        first(){
            this.page =0;
        },
        prev(){
            this.page--;
            if (this.page<0){
                this.last();
            }
        },
        next(){
            this.page++;
            if (this.page>=this.count){
                this.first();
            }
        },
        last(){
            this.page=this.count-1;
        }
    }
    $scope.create = function(){
        if ($scope.form_user.$invalid){
            return  Swal.fire(
                'Vui lòng nhập đầy đủ thông tin các trường!',
                'You clicked the button!',
                'error'
            )
        }
        var item = angular.copy($scope.form);
        console.log(item);
        $http.post(`/rest/accounts`,item).then(resp=>{
            $scope.items.push(resp.data);
            $scope.reset();
            Swal.fire(
                'Thêm mới thành công!',
                'You clicked the button!',
                'success'
            )
            $(".nav-tabs a:eq(1)").tab('show')
        }).catch(error=>{
            Swal.fire(
                'Thêm mới thất bại!',
                'You clicked the button!',
                'error'
            )
            console.log(error);
        });
    }
    $scope.update = function () {
        if ($scope.form_user.$invalid){
            return  Swal.fire(
                'Vui lòng nhập đầy đủ thông tin các trường!',
                'You clicked the button!',
                'error'
            )
        }
        var item = angular.copy($scope.form);
        $http.put(`/rest/accounts/${item.username}`,item).then(resp=>{
            var index = $scope.items.findIndex(p=>p.username==item.username);
            $scope.items[index] = item;
            Swal.fire(
                'Cập nhật thành công!',
                'You clicked the button!',
                'success'
            )
            $(".nav-tabs a:eq(1)").tab('show')
        }).catch(e=>{
            Swal.fire(
                'Cập nhật thất bại!',
                'You clicked the button!',
                'error'
            )
            console.log(e);
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
                $http.delete(`/rest/accounts/${item.username}`).then(resp=>{
                    var index = $scope.items.findIndex(p=>p.username==item.username);
                    $scope.items.splice(index,1);
                    $scope.reset();
                    Swal.fire(
                        'Xóa Thành Công!',
                        'You clicked the button!',
                        'success'
                    )
                    $(".nav-tabs a:eq(1)").tab('show')
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
    $scope.reset = function () {
        $scope.form = {
            photo: 'upload.jpg',
        }
        $scope.index = -1;
    }
    $scope.edit = function(item){
        $scope.form= angular.copy(item);
        $scope.index = item;
        $(".nav-tabs a:eq(0)").tab('show')
    }

    $scope.imageChanged = function(files){
        var data =new FormData();
        data.append('file',files[0]);
        $http.post('/rest/upload/images',data,{
            transformRequest:angular.identity,
            headers:{'Content-Type':undefined}
        }).then(resp=>{
            $scope.form.photo = resp.data.name;
        }).catch(error=>{
            Swal.fire(
                'Upload Failed!',
                'You clicked the button!',
                'error'
            )
            console.log(error);
        })
    }


});
