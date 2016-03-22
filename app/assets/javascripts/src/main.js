document.addEventListener('page:change', function(){
  var load_posts = function(url, body){

    var xhr = new XMLHttpRequest();
    xhr.open('Post', url, true);
    xhr.setRequestHeader('Content-Type', 'application/json');

    xhr.send(JSON.stringify(body));

    xhr.onreadystatechange = function() {
      if (xhr.readyState != 4) return;

      if (xhr.status != 200) {
        alert(xhr.status + ': ' + xhr.statusText);
      } else {
        var posts = JSON.parse(xhr.responseText);

        posts.forEach(function(post) {
          var newPost = document.createElement('div');
          newPost.setAttribute('class', 'post');


          var userNameLink = document.createElement('a');
          userNameLink.setAttribute('href', '/users/' + post['user']['name']);
          var userName = document.createElement('h2');
          userName.innerHTML = post['user']['name'];
          userNameLink.appendChild(userName);
          newPost.appendChild(userNameLink);

          var postLink = document.createElement('a');
          postLink.setAttribute('href', '/users/' + post['user']['name'] + '/' + post['id']);
          var postTitle = document.createElement('h3');
          postTitle.innerHTML = post['title'];
          postLink.appendChild(postTitle);
          newPost.appendChild(postLink);

          var posts_wraper = document.getElementById('posts_wraper');
          posts_wraper.appendChild(newPost);
        })
      }
    }
  };
  //load_posts();


  if (document.getElementById('main_container')){
    var posts_count = 0;

    var load_more = document.getElementById('load_more');
    load_more.addEventListener('click', function(){
      posts_count += 5;
      var body = { 'count': posts_count };
      load_posts('/', body);
    });
  }

  if (document.getElementById('by_user_container')){
    var posts_count = 0;

    var load_more = document.getElementById('load_more');
    load_more.addEventListener('click', function(){
      posts_count += 5;
      var body = {
        'user_name': document.getElementById('posts_wraper').getAttribute('user_name'),
        'count': posts_count
       };
      load_posts(window.location.href, body);
    });
  }

  if (document.getElementById('comment_form')){
    var submit_button = document.getElementById('submit_comment');
    submit_button.addEventListener('click', function(event){
      event.preventDefault();

      var xhr = new XMLHttpRequest();

      xhr.open('Post', '/comments', true);
      xhr.setRequestHeader('Content-Type', 'application/json');

      var body = {
        'comment': {
            'text': document.getElementById('text').value,
            'post_id': document.getElementById('post').getAttribute('post_id')
         }
      };
      xhr.send(JSON.stringify(body));

      xhr.onreadystatechange = function() {
        if (xhr.readyState != 4) return;

        if (xhr.status != 200) {
          alert(xhr.status + ': ' + xhr.statusText);
        } else {
          document.getElementById('text').value = '';
        }
      };
    });
  }

  var search_button = document.getElementById('search_button');
  search_button.addEventListener('click', function(){

    var xhr = new XMLHttpRequest();
    xhr.open('Post', '/search', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    var body = {
      'key': document.getElementById('search_field').value
    }

    xhr.send(JSON.stringify(body));

    xhr.onreadystatechange = function() {
      if (xhr.readyState != 4) return;

      if (xhr.status != 200) {
        alert(xhr.status + ': ' + xhr.statusText);
      } else {
        var posts = JSON.parse(xhr.responseText);

        var body_div = document.getElementById('body');
        while (body_div.firstChild) {
            body_div.removeChild(body_div.firstChild);
        }

        var posts_wraper = document.createElement('div');
        posts_wraper.setAttribute('id', 'posts_wraper');
        body_div.appendChild(posts_wraper);

        posts.forEach(function(post) {
          var newPost = document.createElement('div');
          newPost.setAttribute('class', 'post');


          var userNameLink = document.createElement('a');
          userNameLink.setAttribute('href', '/users/' + post['user']['name']);
          var userName = document.createElement('h2');
          userName.innerHTML = post['user']['name'];
          userNameLink.appendChild(userName);
          newPost.appendChild(userNameLink);

          var postLink = document.createElement('a');
          postLink.setAttribute('href', '/users/' + post['user']['name'] + '/' + post['id']);
          var postTitle = document.createElement('h3');
          postTitle.innerHTML = post['title'];
          postLink.appendChild(postTitle);
          newPost.appendChild(postLink);

          var posts_wraper = document.getElementById('posts_wraper');
          posts_wraper.appendChild(newPost);
        })
      }
    }

  });
});
