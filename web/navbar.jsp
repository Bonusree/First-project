<%@page import="com.entities.user"%>
<div class="navbar">

        <div class="logo">
            <img src="img/comilla (2).jpg" alt=""/>
        </div>
        <div class="instution-name">
            <b>Computer Science and Engineering</b><br><br>
            <b>Online Examination</b>
        </div>
        <div class="menu">
            <a href="active.jsp">Active Exam</a>
            <a href="finished.jsp"> Finished Exam</a>
        </div>
        <div class="dropdown">
            <span><c:out value="${sessionScope.userName}"/></span>
            <div class="content">
                <button id="modalBtn" >Create question</button>
                <div id="simpleModal" class="modal">
                    <div class="modal-content">
                        <span class="closeBtn" id="closeBtn"  >&times;</span>
                        <h2>Question Information:</h2>
                        <form action="questioninformation" method="post" class="">
                            <input type="text" name="session" placeholder="Session">
                                <input type="text" name="deptNmae" placeholder="Department name">
                                <input type="text" name="subName" placeholder="Course Title">
                                <input type="text" name="courseCode" placeholder="Course Code">
                                <input type="text" name="startTime" placeholder="Start time">
                                <input type="text" name="endTime" placeholder="End time">
                                 <input type="text" name="noQue" placeholder="Number of Quetion">
                                <input type="password" name="password" placeholder="Give Password">
                                <button type="submit" style="background-color:rgb(78, 78, 177); border: none; height: 30px; border-radius: 5px;">Submit</button>
                        </form>
                    </div>
                </div>


                <button id="loginModalBtn">Update question</button>
                <div id="loginModal" class="modal">
                    <div class="modal-content">
                        <span class="closeBtn" id="logcloseBtn" onclick="logcloseModal();logoutsideClick(e);">&times;</span>
                        <h2>Question Information:</h2>
                        <form action="" method="" class="">
                           <input type="text" required name="session_year" placeholder="Session">
                               
                                <input type="text" required name="course_code" placeholder="Course Code">
                                 <input type="password" required name="password" placeholder="Give Password">
                                <button type="submit" style="background-color:rgb(78, 78, 177); border: none; height: 30px; border-radius: 5px;">Submit</button>
                        </form>
                    </div>
                </div>



                <button >Logout</button>
            </div>
        </div>
    </div>




    <script>
        var modal = document.getElementById("simpleModal");
        var loginModal = document.getElementById("loginModal");
       
        var modalBtn = document.getElementById("modalBtn");
        var loginModalBtn = document.getElementById("loginModalBtn");
        
        var closeBtn = document.getElementsByClassName("closeBtn")[0];
        var logcloseBtn = document.getElementsByClassName("logcloseBtn")[0];

        modalBtn.addEventListener('click',openModal);
        loginModalBtn.addEventListener('click',loginModalOpen);
        closeBtn.addEventListener('click',closeModal);
        logcloseBtn.addEventListener('click',logcloseModal);
        window.addEventListener('click',outsideClick);
        window.addEventListener('click',logoutsideClick);
      
       

        function loginModalOpen(){
            loginModal.style.display="block";
        }
        
        function openModal(){
            // console.log("kaj kore ni");
            modal.style.display = "block";
        }

        function closeModal(){
            modal.style.display = "none";
            
        }
        function logcloseModal(){
            
            loginModal.style.display="none";
        }

        function outsideClick(e){
            if(e.target==modal){
                modal.style.display = "none";
               
            }
        }
            function logoutsideClick(e){
            if(e.target==loginModal){
                loginModal.style.display="none";
               
            }
        }
    </script>