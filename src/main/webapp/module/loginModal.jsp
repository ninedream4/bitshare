<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal modal-center fade" id="login" tabindex="-1" role="dialog" aria-labelledby="mySmallCenterModalLabel">
  <div class="modal-dialog modal-sm modal-center" role="document">
    <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
              aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>

          </div>
          <div align="center">
            <div class="modal-body"> <br />
              <h2 class="modal-title" id="myModalLabel">Login</h2>
              <hr class="star-primary"></hr>
              

              <form name="loginForm" method="post" action="/user/login">
                <div class="form-group" style="width: 70%; margin: auto;">
                  <div align="left">
                    <label for="inputEmail" style="font-size: 20px;">Email
                      address </label> <input type="email" class="form-control"
                      name="email" id="inputEmail" placeholder="Email" autocomplete=off>
                         <span id="nullEmail" style="display:none;color:red;">Enter your Email</span>
                  </div>
                </div>
                <br />
                <div class="form-group" style="width: 70%; margin: auto;">
                  <div align="left">
                    <label for="inputPassword" style="font-size: 20px;">Password</label>
                    <input type="password" class="form-control" name="pwd"      id="inputPassword" placeholder="Password">
                      <span id="nullPwd" style="display:none;color:red;">Enter your password</span>
                  </div>
                </div>
              </form>
              <br /> <br /> 
            </div>
          </div>
          <div class="modal-footer">
            <button type="button"  id="loginButton" class="btn btn-primary"   onclick='loginSubmit()'>Login</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>