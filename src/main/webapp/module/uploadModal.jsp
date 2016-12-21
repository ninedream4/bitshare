<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="upload" tabindex="-1" role="dialog"
			aria-hidden="true" aria-labelledby="myModalLabel">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div style="text-align: left;"></div>
					</div>
					<div class="modal-body">
						<div style="text-align: center;">
							<h2>upload</h2>
						</div>
						<hr class="star-primary">
						<form name="addContentForm" id="addContentForm" method="post" action="/content/addContent">
							<div class="form-group" style="width: 70%; margin: auto;">
								<div style="text-align: left">
									<label for="title" style="font-size: 20px;">Title</label>
									<input type="textarea" class="form-control" id="title"
										name="title" placeholder="Title">
								</div>
							</div>
							<br />
							<div class="form-group" style="width: 70%; margin: auto;">
								<div style="text-align: left">
									<label for="upload-name" style="font-size: 20px;">Upload</label></br>
									<div class="filebox">
										<input class="upload-name" value="file..." disabled="disabled">
										<label for="file">upload</label>
										<input type="file" id="file" class="upload-hidden"
											name="file">
									</div>
									
								</div>
								<div id="progressbox">
									  <div id="myBar"><div id="statustxt" >0%</div ></div>
								</div>
							</div>
							<br />
							<div class="form-group" style="width:70%; margin: auto;">
								<div style="text-align: left">
									<label for="inputTitle" style="font-size: 20px;">Description</label></br>
									<textarea rows="5" cols="30" class="form-control"
										id="inputTitle" name="fileDesc" placeholder="Description"></textarea>
								</div>
							</div>
							<br />
							<div class="form-group" style="width:70%; margin: auto;">
								<label for="dropdown" style="font-size: 20px;">Category</label></br>
								<select class="selectpicker" title="Choose Category" id="category" name="category">
								  <option>JAVA</option>
								  <option>C/C++</option>
								  <option>WINDOWS</option>
								  <option>etc</option>
								</select>
							</div>
							<br />
							<div class="form-group" style="width:70%; margin: auto;">
								<div style="text-align: left">
									<label for="inputTitle" style="font-size: 20px;">Tags</label> <input
										type="text" class="form-control" id="inputTitle"
										placeholder="Tags" name="tag">
								</div>
							</div>
							<br />
							
							<div class="modal-footer">
								<button type="submit" id="contentUpload" class="btn btn-primary">Submit</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
					
					
				</div>
			</div>
		</div>