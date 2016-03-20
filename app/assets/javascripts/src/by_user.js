document.addEventListener('DOMContentLoaded', function(){

  var load_posts = function(url, body){
    posts_count += 5;

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

  var posts_count = 0;

  var button_offset = document.getElementById('button_offset');
  button_offset.addEventListener('click', function(){
    posts_count += 5;
    var body = {
      'user_name': document.getElementById('posts_wraper').getAttribute('user_name'),
      'count': posts_count
     };
    load_posts(window.location.href, body);
  });

});
