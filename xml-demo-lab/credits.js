function init() {
  console.log("Loading XML data ...");
  const xhr = new XMLHttpRequest();
  xhr.open("GET", "training.xml", true);
  xhr.onreadystatechange = function() {
    if (xhr.readyState !== 4) return;
    if (xhr.status !== 200) {
      document.getElementById("application-errors").innerHTML = 
      `HTTP Error: ${xhr.status} - ${xhr.statusText}`;
      return;
    }
    document.getElementById("xml-document").value = xhr.responseText;
    xmlDoc = xhr.responseXML;

    // client data
    const clientElem = xmlDoc.getElementsByTagName("Client")[0];
    document.getElementById("client-data").innerHTML = 
        `${clientElem.attributes.getNamedItem('firstName').value} ` + 
        `${clientElem.attributes.getNamedItem('lastName').value}`;

    // current application
    const appElem = xmlDoc.getElementsByTagName("Application")[0];
    let appResult = 
    appElem.firstChild.nextSibling.nextSibling.nextSibling.nodeName; //attributes.getNamedItem('applicationTypeName').value;
    appResult += 'Status: ' + appElem.lastChild.nodeName; //attributes.getNamedItem('status').value;
    document.getElementById("current-application").innerHTML = appResult;

    // previous credits
    prevCredits = xmlDoc.getElementsByTagName("PreviousCredit");
    let result =
      "<table><tr><th>Credit</th><th>Begin Date</th><th>Complete Date</th><th>Create Date</th>" +
      "<th>Credit Max Delay</th><th>creditPrincipalAmount</th>";
    for (let i = 0; i < prevCredits.length; i++) {
      const creditNode = prevCredits[i];
      result += `<tr><td>Previous credit ${i + 1}</td>`;
      const attrList = creditNode.attributes;
      for (let j = 0; j < Math.min(attrList.length, 5); j++) {
        const attr = attrList.item(j);
        result += `<td>${attr.value}</td>`;
      }
      result += "</tr>";
    }
    result += "</table>";
    document.getElementById("previous-credits").innerHTML = result;
  };
  xhr.send();
}
