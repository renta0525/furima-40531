document.addEventListener('turbo:load', function(){
  // 新規投稿・編集ページのフォームを取得
  const postForm = document.getElementById('new_post');

  // プレビューを表示するためのスペースを取得
  const previewList = document.getElementById('previews');

  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!postForm) return null;
  console.log("preview.jsが読み込まれました");

  // input要素を取得
  const fileField = postForm.querySelector('input[type="file"][name="post[image]"]');
  if (!fileField) return null;
  // input要素で値の変化が起きた際に呼び出される関数
  fileField.addEventListener('change', function(e){
    console.log("input要素で値の変化が起きました");
  });
});