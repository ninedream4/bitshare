<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="modal fade" id="contentDelete" tabindex="-1" role="dialog"
    aria-hidden="true" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body">
        <h2 align="center">content Delete</h2>
        <hr class="star-primary">
        <form  id="contentDeleteFormBt" name="contentDeleteForm" method="post"  action="/content/contentDelete/">
           <h3 align="center">Are you sure you want to delete it?</h3>
        </form>
          <br/>
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-primary"  onclick="contentDeleteSubmit()">Delete</button>
          
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <style>
h3 {
   text-transform: none;
}
</style>