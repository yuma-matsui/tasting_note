if (document.URL.match( /wines/ ) || location.pathname.match( "create_look" ) ) {
  function preview () {
    const ImageList = document.getElementById('image-list');
    const ImageForm = document.getElementById('look_image');

    ImageForm.addEventListener('change', (e) => {

      const imageContent = document.querySelector('img');
      if (imageContent) {
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('style', 'width: 100px; height: 100px;');

      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);

    });
  };
  window.addEventListener("load", preview);
};