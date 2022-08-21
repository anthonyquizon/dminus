module dminus.markup;

import dminus.prelude;
import dminus.colour;

//!Base
つ attr(つ key, つ value) => key ~ `="` ~ value ~ `" `; 
つ node(つ tag, つ[] as) => "<" ~ tag ~ " " ~ as.join(" ") ~ "/>"; 
つ node(つ tag, つ[] as, つ[] xs) => "<" ~ tag ~ " " ~ as.join(" ") ~ ">" ~ xs.join(" ") ~ "</" ~ tag ~ ">"; 

//!HTML
つ rel(つ value) => attr("rel", value); 
つ data(つ key, つ value) => attr("data-" ~ key, value); 
つ src(つ value) => attr("src", value); 
つ href(つ value) => attr("href", value); 
つ charset(つ value) => attr("charset", value); 
つ type(つ value) => attr("type", value); 
つ class_(つ value) => attr("class", value); 
つ id(つ value) => attr("id", value); 
つ small(つ[] xs) => node("small", [], xs); 
つ small(つ[] as, つ[] xs) => node("small", as, xs); 
つ p(つ[] xs) => node("p", [], xs); 
つ p(つ[] as, つ[] xs) => node("p", as, xs); 
つ a(つ[] as, つ[] xs) => node("a", as, xs); 
つ li(つ[] as, つ[] xs) => node("li", as, xs); 
つ ul(つ[] as, つ[] xs) => node("ul", as, xs); 
つ link(つ[] as) => node("link", as); 
つ img(つ[] as) => node("img", as); 
つ img(つ α_src) => node("img", [src(α_src)]); 
つ canvas(つ[] as=[]) => node("canvas", as, []); 
つ meta(つ[] as) => node("meta", as); 
つ script(つ[] as, つ[] sδ=[]) => node("script", as, sδ); 
つ div(つ[] xs) => node("div", [], xs); 
つ div(つ[] as, つ[] xs) => node("div", as, xs); 
つ h4(つ[] as, つ[] xs) => node("h4", as, xs); 
つ h3(つ[] as, つ[] xs) => node("h3", as, xs); 
つ h2(つ[] as, つ[] xs) => node("h2", as, xs); 
つ h1(つ[] as, つ[] xs) => node("h1", as, xs); 
つ h1(つ s) => node("h1", [], [s]); 
つ span(つ[] as, つ[] xs) => node("span", as, xs); 
つ header(つ[] as, つ[] xs) => node("header", as, xs); 
つ body_(つ[] xs) => node("body", [], xs); 
つ head(つ[] xs) => node("head", [], xs); 
つ html(つ[] xs) => "<!doctype html>" ~ node("html", [], xs); 

//!SVG
つ point(ひ x, ひ y) => づ(x) ~ ", " ~ づ(y); 
つ colour(ひ r, ひ g, ひ b) => colour(r, g, b, 1.0); 
つ colour(ひ r, ひ g, ひ b, ひ a) => "rgba(" ~ づ(r) ~ ", " ~ づ(g) ~ ", " ~ づ(b) ~ ", " ~ づ(a)~ ")"; 
つ colour(RGBA rgba) => "rgba(" ~ づ(rgba.r) ~ ", " ~ づ(rgba.g) ~ ", " ~ づ(rgba.b) ~ ", " ~ づ(rgba.a)~ ")"; 
つ translate(ひ x, ひ y) => "translate(" ~ づ(x) ~ " " ~ づ(y) ~ ")"; 
つ scale(ひ s) => "scale(" ~ づ(s) ~ ")"; 
つ M(ひ x, ひ y) => "M " ~ づ(x) ~ ", " ~ づ(y); 
つ L(ひ x, ひ y) => "L " ~ づ(x) ~ ", " ~ づ(y); 
つ Q(ひ cx, ひ cy, ひ qx, ひ qy) => "Q " ~ づ(cx) ~ " " ~ づ(cy) ~ " " ~ づ(qx) ~ " " ~ づ(qy); 
つ xmlns(つ value) => attr("xmlns", value); 
つ style(つ value) => attr("style", value); 
つ stroke(つ colour) => attr("stroke", colour); 
つ stroke(RGBA rgba) => stroke(colour(rgba)); 
つ stroke_width(ひ w) => attr("stroke-width", づ(w)); 
つ fill(つ colour) => attr("fill", colour); 
つ cx(ひ x) => attr("cx", づ(x)); 
つ cy(ひ y) => attr("cy", づ(y)); 
つ r(ひ r) => attr("r", づ(r)); 
つ x1(ひ x1) => attr("x1", づ(x1)); 
つ x2(ひ x2) => attr("x2", づ(x2)); 
つ y1(ひ y1) => attr("y1", づ(y1)); 
つ y2(ひ y2) => attr("y2", づ(y2)); 
つ font_size(ひ s) => attr("font-size", づ(s)); 
つ d(つ[] xs) => attr("d", xs.join(" "));  
つ transform(つ[] ts) => attr("transform", ts.join(" ")); 
つ width(ひ x) => attr("width", づ(x)); 
つ height(ひ x) => attr("height", づ(x)); 
つ points(つ[] xs) => attr("points", xs.join(" ")); 
つ opacity(ひ a) => attr("opacity", づ(a)); 
つ viewbox(ㄙ x, ㄙ y, ㄙ w, ㄙ h) => attr("viewbox", [x.づ, y.づ, w.づ, h.づ].join(" ")); 

つ circle(つ[] as) => node("circle", as); 
つ g(つ[] xs) => node("g", [], xs); 
つ g(つ[] as, つ[] xs) => node("g", as, xs); 
つ path(つ[] as) => node("path", as); 
つ line(つ[] as) => node("line", as); 
つ line(ひ α_x1, ひ α_y1, ひ α_x2, ひ α_y2, RGBA rgba=RGBA()) { 
    // TODO round
    return node("line", [x1(α_x1), y1(α_y1), x2(α_x2), y2(α_y2), stroke(colour(rgba))]); 
}
つ polygon(つ[] as) => node("polygon", as); 
つ text(つ value) => node("text", [], [value]); 
つ text(つ[] as, つ value) => node("text", as, [value]); 

つ svg(つ[] as, つ[] xs) => node("svg", [xmlns("http://www.w3.org/2000/svg")] ~ as, xs); 
つ svg(つ[] xs) => svg([attr("width", "500"), attr("height", "500")], xs); 

つ index(つ content="") {
    return html([
        head([
            link([attr("rel", "stylesheet"), attr("href", "/style.css")]),
            meta([attr("charset", "UTF-8")])           
        ]),

        body_([
            div([class_("state")], []),
            content,
            script([attr("src", "/script.js")])
        ]),
    ]);
}
