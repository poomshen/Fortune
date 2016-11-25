<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Drag and Drop Interaction Ideas | Sidebar</title>
      <meta charset="UTF-8"><meta name="description" content="Inspiration for drag and drop interactions for the modern UI">
      <meta name="keywords" content="drag and drop, interaction, inspiration, web design, ui">
      <meta name="author" content="Codrops">
      <link rel="shortcut icon" href="../favicon.ico"> 
      <link rel="stylesheet" type="text/css" href="dist/css/normalize.css">
      <link rel="stylesheet" type="text/css" href="dist/fonts/font-awesome-4.2.0/css/font-awesome.min.css">
      <link rel="stylesheet" type="text/css" href="dist/css/icons.css">
      <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
      
      <script src="dist/js/modernizr.custom.js"></script>
   </head>
<body class="skin-4">
      <div class="container">
         <!-- Top Navigation -->
         <div class="codrops-top clearfix">
            <a class="codrops-icon codrops-icon-prev" href="http://tympanus.net/Development/MorphingSearch/"><span>Previous Demo</span></a>
            <span class="right"><a class="codrops-icon codrops-icon-drop" href="http://tympanus.net/codrops/?p=21275"><span>Back to the Codrops Article</span></a></span>
         </div>
         <div class="content">
            <header class="codrops-header">
               <h1>Drag and Drop Interaction Ideas <span>Inspiration for drag and drop interactions for the modern UI</span></h1>
               <nav class="codrops-demos">
                  <a href="index.html">Bottom Area</a>
                  <a href="sidebar.html">Sidebar</a>
                  <a href="page-scale.html">Page Scale</a>
                  <a href="modal.html">Modal</a>
                  <a class="current-demo" href="icons.html">Icons</a>
                  <a href="bottom-slide.html">Bottom Slide</a>
                  <a href="reveal.html">Reveal</a>
               </nav>
            </header>
            <ul id="list" class="list">
               <li class="list__item"><div class="drag-me" style="position: relative;"><i class="fa fa-fw fa-arrows"></i></div></li>
               <li class="list__item"><div class="drag-me" style="position: relative;"><i class="fa fa-fw fa-arrows"></i></div></li>
               <li class="list__item"><div class="drag-me" style="position: relative;"><i class="fa fa-fw fa-arrows"></i></div></li>
               <li class="list__item"><div class="drag-me" style="position: relative;"><i class="fa fa-fw fa-arrows"></i></div></li>
               <li class="list__item"><div class="drag-me" style="position: relative;"><i class="fa fa-fw fa-arrows"></i></div></li>
               <li class="list__item"><div class="drag-me" style="position: relative;"><i class="fa fa-fw fa-arrows"></i></div></li>
               <li class="list__item"><div class="drag-me" style="position: relative;"><i class="fa fa-fw fa-arrows"></i></div></li>
               <li class="list__item"><div class="drag-me" style="position: relative;"><i class="fa fa-fw fa-arrows"></i></div></li>
            </ul></div>
            <!-- Related demos -->
   
         </div><!-- /content -->
      <!-- /container -->
      <div id="drop-area" class="drop-area">
         <div class="drop-area__item"><i class="fa fa-fw fa-archive"></i></div>
         <div class="drop-area__item"><i class="fa fa-fw fa-star"></i></div>
         <div class="drop-area__item"><i class="fa fa-fw fa-exclamation-triangle"></i></div>
         <div class="drop-area__item"><i class="fa fa-fw fa-envelope"></i></div>
         <div class="drop-area__item"><i class="fa fa-fw fa-trash"></i></div>
      </div>
      <div class="drop-overlay"></div>
      <script src="dist/js/draggabilly.pkgd.min.js"></script>
      <script src="dist/js/dragdrop.js"></script>
      <script>
      function al(){
    	  alert("타라");
      }
         (function() {
            var body = document.body,
               dropArea = document.getElementById( 'drop-area' ),
               droppableArr = [], dropAreaTimeout;

            // initialize droppables
            [].slice.call( document.querySelectorAll( '#drop-area .drop-area__item' )).forEach( function( el ) {
               droppableArr.push( new Droppable( el, {
                  onDrop : function( instance, draggableEl ) {
                     // show checkmark inside the droppabe element
                     classie.add( instance.el, 'drop-feedback' );
                     clearTimeout( instance.checkmarkTimeout );
                     instance.checkmarkTimeout = setTimeout( function() { 
                        classie.remove( instance.el, 'drop-feedback' );
                     }, 800 );
                     // ...
                  }
               } ) );
            } );

            // initialize draggable(s)
            [].slice.call(document.querySelectorAll( '#list .drag-me' )).forEach( function( el ) {
               new Draggable( el, droppableArr, {
                  draggabilly : { containment: document.body },
                  onStart : function() {
                     // add class 'drag-active' to body
                     classie.add( body, 'drag-active' );
                     // clear timeout: dropAreaTimeout (toggle drop area)
                     clearTimeout( dropAreaTimeout );
                     // show dropArea
                     classie.add( dropArea, 'show' );
                  },
                  onEnd : function( wasDropped ) {
                	 alert('끝');
                     var afterDropFn = function() {
                        // hide dropArea
                        classie.remove( dropArea, 'show' );
                        // remove class 'drag-active' from body
                        classie.remove( body, 'drag-active' );
                     };

                     if( !wasDropped ) {
                        afterDropFn();
                     }
                     else {
                        // after some time hide drop area and remove class 'drag-active' from body
                        clearTimeout( dropAreaTimeout );
                        dropAreaTimeout = setTimeout( afterDropFn, 400 );
                     }
                  }
               } );
            } );
         })();
      </script>
   

</body>
</html>