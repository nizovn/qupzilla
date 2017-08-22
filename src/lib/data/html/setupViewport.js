/*
 * Copyright (C) 2016 Christophe Chapuis <chris.chapuis@gmail.com>
 * Some websites are not correctly displayed and use an incorrect initial viewport
 * scale.
 * To work around this upstream bug, set the viewport initial scale if it isn't yet defined.
 */

var viewport = document.querySelector("meta[name=viewport]");
if(viewport) {
    var viewportContent = viewport.getAttribute('content');
    if(viewportContent.indexOf('initial-scale')<0) {
        viewportContent += ', initial-scale=1.0';
    }
    viewport.setAttribute('content', viewportContent);
}
else {
    var metaTag=document.createElement('meta');
    metaTag.name = "viewport";
    metaTag.content = "initial-scale=1.0"
    document.getElementsByTagName('head')[0].appendChild(metaTag);
}
