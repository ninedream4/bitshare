<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<div w3-include-html="content.html"></div>

<div class="slide modal" id="modalView" tabindex="-1" role="dialog"
  aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
          aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <br />
      <div align="center">
        <h2>Title</h2>
        <hr class="star-primary">
      </div>
      <div class="modal-body1" vertical-align="middle">
        <div style="display: inline-block; width: 10%;">
          <!--  
          <button type="button" href="#" id="prev" class="btn btn-default" >Prev</button>-->
        </div>
        <div class="cycle-slideshow" data-cycle-fx="scrollHorz"
          data-cycle-timeout="0" data-cycle-prev="#prev"
          data-cycle-next="#next"
          style="width: 79%; height: auto; display: inline-block;">
          <img src="img/portfolio/cabin.png"
            style="width: auto; height: auto;" class="img-responsive" /> <img
            src="img/portfolio/cake.png" style="width: auto; height: auto;"
            class="img-responsive" /> <img src="img/portfolio/circus.png"
            style="width: auto; height: auto;" class="img-responsive" /> <img
            src="img/portfolio/game.png" style="width: auto; height: auto;"
            class="img-responsive" /> <img src="img/portfolio/safe.png"
            style="width: auto9; height: auto;" class="img-responsive" /> <img
            src="img/portfolio/submarine.png"
            style="width: auto; height: auto;" class="img-responsive" />
        </div>
        <div style="width: 10%; display: inline-block;">
          <!--  <button type="button" href=# id="next" class="btn btn-default"
              align="right">Next</button> -->
        </div>
        <div class=center align="center">
          <button type="button" href="#" id="prev" class="btn btn-default">Prev</button>
          <button type="button" href=# id="next" class="btn btn-default"
            align="right">Next</button>
        </div>
      </div>
      <div class="class" align="center" style="clear: both;"></div>
      <div style="overflow:auto; height:350px; width:auto;">
      <div class='comments'>
        <div class='loader'></div>
        <div class='inner'>
          <div class='add-new' style="border-bottom:2px #E5E5E5 solid">
            <label for="your-Email" style="font-size: 20px;">Email</label><br />
            <input class='input your-Email'
              placeholder='Type your Email here...' type='text'>
            <br />
            <textarea class='input your-msg'
              placeholder='Type your message here...' type='text' style="width:80%"></textarea>
            <button class='send-msg'>Send message</button> <br/><br>
          </div>
        </div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



<!-- 
<div class="portfolio-modal modal fade" id="modalView" tabindex="-1"
  role="dialog" aria-hidden="true">
  <div class="modal-content">
    <div class="close-modal" data-dismiss="modal">
      <div class="lr">
        <div class="rl"></div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
          <div id="modalBody"></div>
        </div>
      </div>
    </div>
  </div>
</div>
 -->
