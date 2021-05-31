function openCloseToc() {
    if(document.getElementById('toc-content').style.display === 'block') {
        document.getElementById('toc-content').style.display = 'none';
        document.getElementById('toc-toggle').element.classList.toggle('icon-up-dir');
    } else {
        document.getElementById('toc-content').style.display = 'block';
        document.getElementById('toc-toggle').element.classList.toggle('icon-up-dir');
    }
}