<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    
<div class="modal fade" id="mypage" tabindex="-1" role="dialog"
      aria-hidden="true" aria-labelledby="myModalLabel">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"    aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>

          </div>
          <div class="modal-body">
            <h2 align="center">Info Update</h2>
            <hr class="star-primary">

                 <form name="updateUserForm" id="updateUserForm" method="post"  action="/user/updateUser">
              <div class="form-group" style="width: 70%; margin: auto;">
                <label for="inputEmail" style="font-size: 20px;">Email address</label> 
                <input type="text" class="form-control" placeholder="${user.email}" autocomplete=off>
                <input name="userId" type="hidden" value="${user.userId }"/>
         		    <input name="email" type="hidden" value="${user.email }"/>
                               
                 <span id="errorEmail" style="display:none;color:red;">Check your Email Type</span>
                 <span id="differentEmail"  style="display:none;color:red;">Please enter a different Email</span>    
                 <span id="succsessEmail" style="display:none;color:blue;">Available email.</span>
              </div>

              <br />

              <div class="form-group" style="width: 70%; margin: auto;">
                <label for="inputPassword" style="font-size: 20px;">Update Password</label>
                <input type="password" class="form-control" id="pwd" name="pwd"     placeholder="Update Password">
                     <span id="errorPwd" style="display:none;color:red;">Check your password</span>
              </div>

              <br />

              <div class="form-group" style="width: 70%; margin: auto;">
                <label for="inputConfirmPassowrd" style="font-size: 20px;">Update Password Confirm </label> 
                <input type="password" class="form-control" id="confirmPwd" name="confirmPwd" placeholder="Update ConfirmPassowrd">
              </div>

              <br />

              <div class="form-group" style="width: 70%; margin: auto;">
                <label for="inputTag" style="font-size: 20px;">Update Tag</label> <input
                  type="text" class="form-control" id="inputTag" name="tag"
                  placeholder="${user.tag }">
              </div>
            </form>

            <br />
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" onclick="updateUserSubmit()">Sign Up</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>