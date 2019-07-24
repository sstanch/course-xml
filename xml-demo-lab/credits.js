function init() {
    console.log("Loading XML data ...");
    const xhr = new XMLHttpRequest();
    xhr.open("GET", "training.xml", true);
    xhr.onreadystatechange = function() {
        if(xhr.readyState !== 4) return;
        if(xhr.status !== 200) {
            document.getElementById('application-errors').innerHTML =
                `HTTP Error: ${xhr.status} - ${xhr.statusText}`;
                return;
        }
        document.getElementById('xml-document').value = xhr.responseText;
    }
    xhr.send();
}