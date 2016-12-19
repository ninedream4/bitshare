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
          <div class="modal-body">
            <br />
            <div align="center">
            <h2>Title</h2>
            <hr class="star-primary">
          </div>
              <div style="width: 100% \9; height: auto; display: block;" >
                <div class="cycle-slideshow" data-cycle-fx="scrollHorz"
                  data-cycle-timeout="0" data-cycle-prev="#prev"
                  data-cycle-next="#next" align="center">
                  <img src="img/portfolio/cabin.png" style="width: auto; height: auto; display: block;"class="img-responsive" />
                  <img src="img/portfolio/cake.png"
                    style="width: auto; height: auto; display: block;"class="img-responsive"/> <img
                    src="img/portfolio/circus.png"
                    style="width: auto; height: auto; display: block;"class="img-responsive"/> <img
                    src="img/portfolio/game.png"
                    style="width: auto; height: auto; display: block;"class="img-responsive"/> <img
                    src="img/portfolio/safe.png"
                    style="width: auto9; height: auto; display: block;"class="img-responsive"/> <img
                    src="img/portfolio/submarine.png"
                    style="width: auto; height: auto; display: block;"class="img-responsive"/>
                </div>
              </div>
          </div>
          <!--  -->
          <div class="class"  align="center">
            <button type="button" href="#" id="prev" class="btn btn-default" >Prev</button>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <button type="button" href=# id="next" class="btn btn-default" >Next</button>
            <br />
            <br />
            </div>
            <div class="row" style="position:relative;padding-left: 30px; padding-right: 30px;">
            <div align="left">
              <div style="font-size: 20px;">Comment</div>
              <label style="font-size: 20px; " align="left">Email</label>
              <br>
              
              <div class="col-xs-8">
                  <input type="text" class="form-control" placeholder="Share your through ....." >
                </div>
              <button type="button" class="btn btn-primary" onclick="addCommentSubmit()" align="left">Submit</button>
              </div>
              </div>
              <div class=commentList style="position:relative;padding-left: 30px; padding-right: 30px;"align="left">
              <a href="#" id="Email">Email</a>
              <label for="inputComment" style="font-size: 20px; ">Comment</label>
              <text name="comments" id="comments" cols="25" rows="3"></text>

              
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
          </div>
      </div>
    </div>
  </div>

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
		
		