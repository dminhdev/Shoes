$(document).ready(function () {
    $("#loginForm").submit(function (e) {
        e.preventDefault();
    }).validate({
        rules: {
            login_email: {
                required: true,
                email: true,
                maxlength: 50
            },
            login_password: {
                required: true,
                rangelength: [6, 20]
            }
        },
        messages: {
            login_email: {
                required: "Vui lòng nhập email!",
                email: "Email không đúng định dạng!",

            },
            login_password: {
                required: "Vui lòng nhập mật khẩu!",
                rangelength: "Mật khẩu có độ dài từ 6-20 ký tự!",
            }
        },

        submitHandler: function () {
            let email = $("#login_email").val();
            let password = $("#login_password").val();

            req = {
                email: email,
                password: password
            }
            let myJSON = JSON.stringify(req);
            $.ajax({
                url: '/api/login',
                type: 'POST',
                data: myJSON,
                contentType: "application/json; charset=utf-8",
                success: function(data) {
                    toastr.success("Đăng nhập thành công");
                    signedValidate(true, data.fullName,data.roles);
                    $('.modal').modal('hide');
                },
                error: function(error) {
                    toastr.warning(error.responseJSON.message);
                },
            });
        }

    });

    $("#registerForm").submit(function (e) {
        e.preventDefault();
    }).validate({
        rules: {
            register_full_name: {
                required: true,
                maxlength: 25
            },
            register_phone: {
                required: true,
                phone: true
            },
            register_email: {
                required: true,
                email: true,
                maxlength: 25
            },
            register_password: {
                required: true,
                rangelength: [6, 25]
            },
            register_confirm_password: {
                required: true,
                equalTo: "#register_password",
                rangelength: [6, 25]
            }
        },
        messages: {
            register_full_name: {
                required: "Vui lòng nhập đầy đủ họ và tên!",
                maxlength: "Tên có độ dài tối đa 25 ký tự!",

            },
            register_phone: {
                required: "Vui lòng nhập số điện thoại!",
            },
            register_email: {
                required: "Vui lòng nhập email!",
                email: "Email không đúng định dạng!",
                maxlength: "Email có độ dài tối đa 25 ký tự!",
            },
            register_password: {
                required: "Vui lòng nhập mật khẩu!",
                rangelength: "Mật khẩu có độ dài từ 6-20 ký tự!"
            },
            register_confirm_password: {
                required: "Vui lòng nhập lại mật khẩu!",
                equalTo: "Mật khẩu không trùng nhau!",
                rangelength: "Mật khẩu có độ dài từ 6-20 ký tự!"
            }
        },

        submitHandler: function () {
            let fullName = $("#register_full_name").val();
            let phone = $("#register_phone").val();
            let email = $("#register_email").val();
            let password = $("#register_password").val();


            req = {
                fullName: fullName,
                email: email,
                password: password,
                phone: phone
            }
            var myJSON = JSON.stringify(req);
            $.ajax({
                url: '/api/register',
                type: 'POST',
                data: myJSON,
                contentType: "application/json; charset=utf-8",
                success: function(data) {
                    toastr.success("Đăng ký thành công");
                    signedValidate(true, data.fullName,data.roles);
                    $('.modal').modal('hide');
                },
                error: function(error) {
                    toastr.warning(error.responseJSON.message);
                },
            });
        }
    })
});

$.validator.addMethod("phone", function (value, element) {
    return this.optional(element) || /((09|03|07|08|05)+([0-9]{8})\b)/g.test(value);
}, "Số điện thoại không hợp lệ!")
function signedValidate(status = false, fullname = '',roles='') {
    if (status == true) {
        isLogined = true;
        if(roles =='USER'){
            let Link_USER =`<li class="tool-admin float-right"><a href="/#"></a></li>`;
            $('.tool-admin').replaceWith(Link_USER);
        }else {
            let Link_AD =`<li class="tool-admin float-right"><a href="/admin">Quản trị trang</a></li>`;
            $('.tool-admin').replaceWith(Link_AD);
        }

        let signedLink = `<div class="mt-4">
        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-toggle="dropdown">
                <span  id="account-setting" class="nav-item dropdown pe-3">Xin chào ${fullname}</span>
                <i class="bi bi-caret-down-fill ml-1 mt-1"></i>
              </a>
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li>
              <a class="dropdown-item d-flex align-items-center" href="/tai-khoan">
                <i class="bi bi-person"></i>
                <span>Thông tin tài khoản</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="/tai-khoan/lich-su-giao-dich">
                <i class="bi bi-cart"></i>
                <span>Quản lý đơn hàng</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="/api/logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Đăng xuất</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
</div>
`;
        let SignedCart =`<a href="" data-toggle="modal" data-target="#CartModal" style="font-size:2.5rem;padding-top: 1rem;" class=" bi bi-cart cart-buy">
                                <label style="margin-left: -3px;float: right;border-radius: 10px;width: 20px;height: 21px;padding: 2px 4px 2px 6px;background: red;color: #ffff;">0</label>
                            </a>`;
        $('.cart-buy').replaceWith(SignedCart);
        $('.account-setting').replaceWith(signedLink);
    }else {
        isLogined = false;
        let notSignedLink = `
              <a href="#" data-toggle="modal" data-target="#exampleModal" class="header-icon account-setting"><i class="icon-user-2"></i></a>
          `;
        let notSignedCart=`<a href="#" style="font-size:2.5rem;padding-top: 1rem;" class=" bi bi-cart cart-buy"> </a>`;
        $('.account-setting').replaceWith(notSignedLink);
        $('.cart-buy').click(function() {
            if(isLogined==false){
                toastr.warning("Vui lòng đăng nhập để đặt hàng");
                setTimeout(function() {
                    $('#exampleModal').modal('show');
                }, 500);
            }
        })
    }
}

$(document).on('keyup', function (e) {
    let target = e.target;

    if (target.closest('.search-input')) {
        var keycode = (e.keyCode ? e.keyCode : e.which);
        if(keycode == '13'){
            searchProductByKeyword();
        }
    }
})


$('.search-button').click(function() {
    searchProductByKeyword();
})

function searchProductByKeyword() {
    let keyword = $('.search-input').val();
    if (keyword.length == 0) {
        toastr.warning("Vui lòng nhập từ khóa tìm kiếm");
        return
    }
    location.href="/api/tim-kiem?keyword="+keyword;
}