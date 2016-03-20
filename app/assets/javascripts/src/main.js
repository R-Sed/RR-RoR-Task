document.addEventListener('DOMContentLoaded', function(){
  var posts_count = 0;

  var xhr = new XMLHttpRequest();

  var load_posts = function(){
    posts_count += 5;
    xhr.open('Post', '/', true);
    xhr.setRequestHeader('Content-Type', 'application/json');

    var body = { 'count': posts_count };
    xhr.send(JSON.stringify(body));

    xhr.onreadystatechange = function() {
      if (xhr.readyState != 4) return;

      if (xhr.status != 200) {
        alert(xhr.status + ': ' + xhr.statusText);
      } else {
        var posts = JSON.parse(xhr.responseText);

        posts.forEach(function(post) {
          var newPost = document.createElement('div');

          var userName = document.createElement('h2');
          userName.innerHTML = post['user']['name'];
          newPost.appendChild(userName);

          var postTitle = document.createElement('h3');
          postTitle.innerHTML = post['title'];
          newPost.appendChild(postTitle);

          var postText = document.createElement('p');
          postText.innerHTML = post['text'];
          newPost.appendChild(postText);

          var posts_wraper = document.getElementById('posts_wraper');
          posts_wraper.appendChild(newPost);
        })
      }
    }
  };
  //load_posts();

  var button_offset = document.getElementById('button_offset');
  button_offset.addEventListener('click', function(){
    load_posts();
  });

});
