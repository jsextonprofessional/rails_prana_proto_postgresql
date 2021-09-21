// >this._process()),this.refresh(),this._process()}static get Default(){return $t}static get NAME(){return"scrollspy"}refresh(){const t=this._scrollElement===this._scrollElement.window?"offset":"position",e="auto"===this._config.method?t:this._config.method,i="position"===e?this._getScrollTop():0;this._offsets=[],this._targets=[],this._scrollHeight=this._getScrollHeight(),V.find(Ut,this._config.target).map(t=>{const s=n(t),o=s?V.findOne(s):null;if(o){const t=o.getBoundingClientRect();if(t.width||t.height)return[K[e](o).top+i,s]}return null}).filter(t=>t).sort((t,e)=>t[0]-e[0]).forEach(t=>{this._offsets.push(t[0]),this._targets.push(t[1])})}dispose(){H.off(this._scrollElement,".bs.scrollspy"),super.dispose()}_getConfig(t){return(t={...$t,...K.getDataAttributes(this._element),..."object"==typeof t&&t?t:{}}).target=l(t.target)||document.documentElement,c("scrollspy",t,qt),t}_getScrollTop(){return this._scrollElement===window?this._scrollElement.pageYOffset:this._scrollElement.scrollTop}_getScrollHeight(){return this._scrollElement.scrollHeight||Math.max(document.body.scrollHeight,document.documentElement.scrollHeight)}_getOffsetHeight(){return this._scrollElement===window?window.innerHeight:this._scrollElement.getBoundingClientRect().height}_process(){const t=this._getScrollTop()+this._config.offset,e=this._getScrollHeight(),i=this._config.offset+e-this._getOffsetHeight();if(this._scrollHeight!==e&&this.refresh(),t>=i){const t=this._targets[this._targets.length-1];this._activeTarget!==t&&this._activate(t)}else{if(this._activeTarget&&t<this._offsets[0]&&this._offsets[0]>0)return this._activeTarget=null,void this._clear();for(let e=this._offsets.length;e--;)this._activeTarget!==this._targets[e]&&t>=this._offsets[e]&&(void 0===this._offsets[e+1]||t<this._offsets[e+1])&&this._activate(this._targets[e])}}_activate(t){this._activeTarget=t,this._clear();const e=Ut.split(",").map(e=>`${e}[data-bs-target="${t}"],${e}[href="${t}"]`),i=V.findOne(e.join(","),this._config.target);i.classList.add("active"),i.classList.contains("dropdown-item")?V.findOne(".dropdown-toggle",i.closest(".dropdown")).classList.add("active"):V.parents(i,".nav, .list-group").forEach(t=>{V.prev(t,".nav-link, .list-group-item").forEach(t=>t.classList.add("active")),V.prev(t,".nav-item").forEach(t=>{V.children(t,".nav-link").forEach(t=>t.classList.add("active"))})}),H.trigger(this._scrollElement,"activate.bs.scrollspy",{relatedTarget:t})}_clear(){V.find(Ut,this._config.target).filter(t=>t.classList.contains("active")).forEach(t=>t.classList.remove("active"))}static jQueryInterface(t){return this.each((function(){const e=Kt.getOrCreateInstance(this,t);if("string"==typeof t){if(void 0===e[t])throw new TypeError(`No method named "${t}"`);e[t]()}}))}}H.on(window,"load.bs.scrollspy.data-api",()=>{V.find('[data-bs-spy="scroll"]').forEach(t=>new Kt(t))}),b(Kt);class Vt extends R{static get NAME(){return"tab"}show(){if(this._element.parentNode&&this._element.parentNode.nodeType===Node.ELEMENT_NODE&&this._element.classList.contains("active"))return;let t;const e=o(this._element),i=this._element.closest(".nav, .list-group");if(i){const e="UL"===i.nodeName||"OL"===i.nodeName?":scope > li > .active":".active";t=V.find(e,i),t=t[t.length-1]}const s=t?H.trigger(t,"hide.bs.tab",{relatedTarget:this._element}):null;if(H.trigger(this._element,"show.bs.tab",{relatedTarget:t}).defaultPrevented||null!==s&&s.defaultPrevented)return;this._activate(this._element,i);const n=()=>{H.trigger(t,"hidden.bs.tab",{relatedTarget:this._element}),H.trigger(this._element,"shown.bs.tab",{relatedTarget:t})};e?this._activate(e,e.parentNode,n):n()}_activate(t,e,i){const s=(!e||"UL"!==e.nodeName&&"OL"!==e.nodeName?V.children(e,".active"):V.find(":scope > li > .active",e))[0],n=i&&s&&s.classList.contains("fade"),o=()=>this._transitionComplete(t,s,i);s&&n?(s.classList.remove("show"),this._queueCallback(o,t,!0)):o()}_transitionComplete(t,e,i){if(e){e.classList.remove("active");const t=V.findOne(":scope > .dropdown-menu .active",e.parentNode);t&&t.classList.remove("active"),"tab"===e.getAttribute("role")&&e.setAttribute("aria-selected",!1)}t.classList.add("active"),"tab"===t.getAttribute("role")&&t.setAttribute("aria-selected",!0),p(t),t.classList.contains("fade")&&t.classList.add("show");let s=t.parentNode;if(s&&"LI"===s.nodeName&&(s=s.parentNode),s&&s.classList.contains("dropdown-menu")){const e=t.closest(".dropdown");e&&V.find(".dropdown-toggle",e).forEach(t=>t.classList.add("active")),t.setAttribute("aria-expanded",!0)}i&&i()}static jQueryInterface(t){return this.each((function(){const e=Vt.getOrCreateInstance(this);if("string"==typeof t){if(void 0===e[t])throw new TypeError(`No method named "${t}"`);e[t]()}}))}}H.on(document,"click.bs.tab.data-api",'[data-bs-toggle="tab"], [data-bs-toggle="pill"], [data-bs-toggle="list"]',(function(t){["A","AREA"].includes(this.tagName)&&t.preventDefault(),d(this)||Vt.getOrCreateInstance(this).show()})),b(Vt);const Xt={animation:"boolean",autohide:"boolean",delay:"number"},Yt={animation:!0,autohide:!0,delay:5e3};class Qt extends R{constructor(t,e){super(t),this._config=this._getConfig(e),this._timeout=null,this._hasMouseInteraction=!1,this._hasKeyboardInteraction=!1,this._setListeners()}static get DefaultType(){return Xt}static get Default(){return Yt}static get NAME(){return"toast"}show(){H.trigger(this._element,"show.bs.toast").defaultPrevented||(this._clearTimeout(),this._config.animation&&this._element.classList.add("fade"),this._element.classList.remove("hide"),p(this._element),this._element.classList.add("show"),this._element.classList.add("showing"),this._queueCallback(()=>{this._element.classList.remove("showing"),H.trigger(this._element,"shown.bs.toast"),this._maybeScheduleHide()},this._element,this._config.animation))}hide(){this._element.classList.contains("show")&&(H.trigger(this._element,"hide.bs.toast").defaultPrevented||(this._element.classList.add("showing"),this._queueCallback(()=>{this._element.classList.add("hide"),this._element.classList.remove("showing"),this._element.classList.remove("show"),H.trigger(this._element,"hidden.bs.toast")},this._element,this._config.animation)))}dispose(){this._clearTimeout(),this._element.classList.contains("show")&&this._element.classList.remove("show"),super.dispose()}_getConfig(t){return t={...Yt,...K.getDataAttributes(this._element),..."object"==typeof t&&t?t:{}},c("toast",t,this.constructor.DefaultType),t}_maybeScheduleHide(){this._config.autohide&&(this._hasMouseInteraction||this._hasKeyboardInteraction||(this._timeout=setTimeout(()=>{this.hide()},this._config.delay)))}_onInteraction(t,e){switch(t.type){case"mouseover":case"mouseout":this._hasMouseInteraction=e;break;case"focusin":case"focusout":this._hasKeyboardInteraction=e}if(e)return void this._clearTimeout();const i=t.relatedTarget;this._element===i||this._element.contains(i)||this._maybeScheduleHide()}_setListeners(){H.on(this._element,"mouseover.bs.toast",t=>this._onInteraction(t,!0)),H.on(this._element,"mouseout.bs.toast",t=>this._onInteraction(t,!1)),H.on(this._element,"focusin.bs.toast",t=>this._onInteraction(t,!0)),H.on(this._element,"focusout.bs.toast",t=>this._onInteraction(t,!1))}_clearTimeout(){clearTimeout(this._timeout),this._timeout=null}static jQueryInterface(t){return this.each((function(){const e=Qt.getOrCreateInstance(this,t);if("string"==typeof t){if(void 0===e[t])throw new TypeError(`No method named "${t}"`);e[t](this)}}))}}return F(Qt),b(Qt),{Alert:W,Button:$,Carousel:et,Collapse:nt,Dropdown:pt,Modal:Tt,Offcanvas:Lt,Popover:Wt,ScrollSpy:Kt,Tab:Vt,Toast:Qt,Tooltip:Bt}}));
// remote:         11579 //# sourceMappingURL=bootstrap.min.js.map
// remote:         11580 ;
// remote:         11581 (function() {
// remote:         11582 
// remote:         11583 
// remote:         11584 }).call(this);
// remote:         11585 (function() {
// remote:         11586 
// remote:        ==
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/uglifier-4.2.0/lib/uglifier.rb:291:in `parse_result'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/uglifier-4.2.0/lib/uglifier.rb:221:in `run_uglifyjs'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/uglifier-4.2.0/lib/uglifier.rb:166:in `compile'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/uglifier_compressor.rb:53:in `call'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/uglifier_compressor.rb:28:in `call'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/processor_utils.rb:75:in `call_processor'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/processor_utils.rb:57:in `block in call_processors'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/processor_utils.rb:56:in `reverse_each'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/processor_utils.rb:56:in `call_processors'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/loader.rb:134:in `load_from_unloaded'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/loader.rb:60:in `block in load'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/loader.rb:317:in `fetch_asset_from_dependency_cache'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/loader.rb:44:in `load'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/cached_environment.rb:20:in `block in initialize'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/cached_environment.rb:47:in `load'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/base.rb:66:in `find_asset'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/base.rb:73:in `find_all_linked_assets'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/manifest.rb:142:in `block in find'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/legacy.rb:114:in `block (2 levels) in logical_paths'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/path_utils.rb:228:in `block in stat_tree'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/path_utils.rb:212:in `block in stat_directory'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/path_utils.rb:209:in `each'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/path_utils.rb:209:in `stat_directory'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/path_utils.rb:227:in `stat_tree'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/legacy.rb:105:in `each'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/legacy.rb:105:in `block in logical_paths'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/legacy.rb:104:in `each'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/legacy.rb:104:in `logical_paths'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/manifest.rb:140:in `find'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/sprockets/manifest.rb:186:in `compile'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-rails-3.2.2/lib/sprockets/rails/task.rb:67:in `block (3 levels) in define'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-3.7.2/lib/rake/sprocketstask.rb:147:in `with_logger'
// remote:        /tmp/build_f5c27884/vendor/bundle/ruby/2.6.0/gems/sprockets-rails-3.2.2/lib/sprockets/rails/task.rb:66:in `block (2 levels) in define'
// remote:        Tasks: TOP => assets:precompile
// remote:        (See full trace by running task with --trace)
// remote: 
// remote:  !
// remote:  !     Precompiling assets failed.
// remote:  !
// remote:  !     Push rejected, failed to compile Ruby app.
// remote: 
// remote:  !     Push failed
// remote:  !
// remote:  ! ## Warning - The same version of this code has already been built: 91a1bef42ebf7aa6406d14cdcca1bb3359e99352
// remote:  !
// remote:  ! We have detected that you have triggered a build from source code with version 91a1bef42ebf7aa6406d14cdcca1bb3359e99352
// remote:  ! at least twice. One common cause of this behavior is attempting to deploy code from a different branch.
// remote:  !
// remote:  ! If you are developing on a branch and deploying via git you must run:
// remote:  !
// remote:  !     git push heroku <branchname>:main
// remote:  !
// remote:  ! This article goes into details on the behavior:
// remote:  !   https://devcenter.heroku.com/articles/duplicate-build-version
// remote: 
// remote: Verifying deploy...
// remote: 
// remote: !       Push rejected to afternoon-beyond-72366.
// remote: 
// To https://git.heroku.com/afternoon-beyond-72366.git
//  ! [remote rejected] master -> master (pre-receive hook declined)
// error: failed to push some refs to 'https://git.heroku.com/afternoon-beyond-72366.git'
// vagrant@vagrant-ubuntu-trusty-64:/vagrant/prana_proto_postgresql/prana$ 
// vagrant@vagrant-ubuntu-trusty-64:/vagrant/prana_proto_postgresql/prana$ heroku logs
// 2021-09-21T19:53:17.940681+00:00 app[api]: Initial release by user jsextonprofessional@protonmail.com
// 2021-09-21T19:53:17.940681+00:00 app[api]: Release v1 created by user jsextonprofessional@protonmail.com
// 2021-09-21T19:53:18.995336+00:00 app[api]: Release v2 created by user jsextonprofessional@protonmail.com
// 2021-09-21T19:53:18.995336+00:00 app[api]: Enable Logplex by user jsextonprofessional@protonmail.com
// 2021-09-21T19:53:41.000000+00:00 app[api]: Build started by user jsextonprofessional@protonmail.com
// 2021-09-21T19:54:23.000000+00:00 app[api]: Build failed -- check your build output: https://dashboard.heroku.com/apps/6c09630b-2234-4bfa-9c55-88a6bd0885b9/activity/builds/acaa8370-6ee5-42ba-8fb0-92b166d8116c
// 2021-09-21T19:56:10.449911+00:00 heroku[router]: at=info code=H81 desc="Blank app" method=GET path="/" host=afternoon-beyond-72366.herokuapp.com request_id=cdf3072a-3b2f-4039-9527-994f7c3d5788 fwd="76.185.114.198" dyno= connect= service= status=502 bytes= protocol=https
// 2021-09-21T19:56:10.845590+00:00 heroku[router]: at=info code=H81 desc="Blank app" method=GET path="/favicon.ico" host=afternoon-beyond-72366.herokuapp.com request_id=e58621a0-c7c3-4c06-93de-91e237fb4d47 fwd="76.185.114.198" dyno= connect= service= status=502 bytes= protocol=https
// 2021-09-21T19:58:13.000000+00:00 app[api]: Build started by user jsextonprofessional@protonmail.com
// 2021-09-21T19:58:55.000000+00:00 app[api]: Build failed -- check your build output: https://dashboard.heroku.com/apps/6c09630b-2234-4bfa-9c55-88a6bd0885b9/activity/builds/99fe7316-243e-49b0-bbcd-4f56fa5c0afc
// 2021-09-21T20:01:48.000000+00:00 app[api]: Build started by user jsextonprofessional@protonmail.com
// 2021-09-21T20:02:32.000000+00:00 app[api]: Build failed -- check your build output: https://dashboard.heroku.com/apps/6c09630b-2234-4bfa-9c55-88a6bd0885b9/activity/builds/d406a2e7-b443-45cb-95f0-142c04d27bb9
// 2021-09-21T20:03:36.000000+00:00 app[api]: Build started by user jsextonprofessional@protonmail.com
// 2021-09-21T20:04:19.000000+00:00 app[api]: Build failed -- check your build output: https://dashboard.heroku.com/apps/6c09630b-2234-4bfa-9c55-88a6bd0885b9/activity/builds/b02b3286-f144-454b-9457-34e0b3e7baee
// vagrant@vagrant-ubuntu-trusty-64:/vagrant/prana_proto_postgresql/prana$ git add .
// vagrant@vagrant-ubuntu-trusty-64:/vagrant/prana_proto_postgresql/prana$ git commit -m "try again"
// [master 131d038] try again
//  6 files changed, 11638 insertions(+), 1 deletion(-)
//  create mode 100644 public/assets/.sprockets-manifest-ad79115811457910dc86e61a88104b98.json
//  create mode 100644 public/assets/application-05214884b1e0fbe30126253a605e97f518c179a3e0a3788f9b5222ca835261eb.css
//  create mode 100644 public/assets/application-05214884b1e0fbe30126253a605e97f518c179a3e0a3788f9b5222ca835261eb.css.gz
//  create mode 100644 public/assets/application-5c8338e895ff505b4e7b2d7f8335e338629ef82619661118d95fd3ad0d0e3162.js
//  create mode 100644 public/assets/application-5c8338e895ff505b4e7b2d7f8335e338629ef82619661118d95fd3ad0d0e3162.js.gz
// vagrant@vagrant-ubuntu-trusty-64:/vagrant/prana_proto_postgresql/prana$ git push heroku master
// Counting objects: 125, done.
// Delta compression using up to 2 threads.
// Compressing objects: 100% (117/117), done.
// Writing objects: 100% (125/125), 323.88 KiB | 0 bytes/s, done.
// Total 125 (delta 13), reused 0 (delta 0)
// remote: Compressing source files... done.
// remote: Building source:
// remote: 
// remote: -----> Building on the Heroku-20 stack
// remote: -----> Determining which buildpack to use for this app
// remote: -----> Ruby app detected
// remote: -----> Installing bundler 1.17.3
// remote: -----> Removing BUNDLED WITH version in the Gemfile.lock
// remote: -----> Compiling Ruby/Rails
// remote: -----> Using Ruby version: ruby-2.6.6
// remote: -----> Installing dependencies using bundler 1.17.3
// remote:        Running: BUNDLE_WITHOUT='development:test' BUNDLE_PATH=vendor/bundle BUNDLE_BIN=vendor/bundle/bin BUNDLE_DEPLOYMENT=1 BUNDLE_GLOBAL_PATH_APPENDS_RUBY_SCOPE=1 bundle install -j4
// remote:        Fetching gem metadata from https://rubygems.org/.............
// remote:        Fetching rake 13.0.6
// remote:        Installing rake 13.0.6
// remote:        Fetching concurrent-ruby 1.1.9
// remote:        Fetching minitest 5.14.4
// remote:        Fetching thread_safe 0.3.6
// remote:        Installing minitest 5.14.4
// remote:        Installing concurrent-ruby 1.1.9
// remote:        Installing thread_safe 0.3.6
// remote:        Fetching builder 3.2.4
// remote:        Installing builder 3.2.4
// remote:        Fetching erubis 2.7.0
// remote:        Fetching mini_portile2 2.6.1
// remote:        Installing mini_portile2 2.6.1
// remote:        Installing erubis 2.7.0
// remote:        Fetching racc 1.5.2
// remote:        Fetching crass 1.0.6
// remote:        Installing crass 1.0.6
// remote:        Fetching rack 1.6.13
// remote:        Installing racc 1.5.2 with native extensions
// remote:        Installing rack 1.6.13
// remote:        Fetching mini_mime 1.1.1
// remote:        Installing mini_mime 1.1.1
// remote:        Fetching arel 6.0.4
// remote:        Installing arel 6.0.4
// remote:        Fetching bcrypt 3.1.16
// remote:        Installing bcrypt 3.1.16 with native extensions
// remote:        Using bundler 1.17.3
// remote:        Fetching coffee-script-source 1.12.2
// remote:        Installing coffee-script-source 1.12.2
// remote:        Fetching execjs 2.8.1
// remote:        Installing execjs 2.8.1
// remote:        Fetching thor 1.1.0
// remote:        Installing thor 1.1.0
// remote:        Fetching ffi 1.15.4
// remote:        Installing ffi 1.15.4 with native extensions
// remote:        Fetching hirb 0.7.3
// remote:        Installing hirb 0.7.3
// remote:        Fetching json 1.8.6
// remote:        Installing json 1.8.6 with native extensions
// remote:        Fetching pg 0.21.0
// remote:        Installing pg 0.21.0 with native extensions
// remote:        Fetching rails_serve_static_assets 0.0.5
// remote:        Installing rails_serve_static_assets 0.0.5
// remote:        Fetching rails_stdout_logging 0.0.5
// remote:        Installing rails_stdout_logging 0.0.5
// remote:        Fetching rb-fsevent 0.11.0
// remote:        Installing rb-fsevent 0.11.0
// remote:        Fetching rdoc 4.3.0
// remote:        Installing rdoc 4.3.0
// remote:        Fetching tilt 2.0.10
// remote:        Installing tilt 2.0.10
// remote:        Fetching turbolinks-source 5.2.0
// remote:        Installing turbolinks-source 5.2.0
// remote:        Fetching tzinfo 1.2.9
// remote:        Installing tzinfo 1.2.9
// remote:        Fetching i18n 0.9.5
// remote:        Installing i18n 0.9.5
// remote:        Fetching rack-test 0.6.3
// remote:        Installing rack-test 0.6.3
// remote:        Fetching sprockets 3.7.2
// remote:        Installing sprockets 3.7.2
// remote:        Fetching mail 2.7.1
// remote:        Installing mail 2.7.1
// remote:        Fetching coffee-script 2.4.1
// remote:        Installing coffee-script 2.4.1
// remote:        Fetching uglifier 4.2.0
// remote:        Installing uglifier 4.2.0
// remote:        Fetching nokogiri 1.12.4 (x86_64-linux)
// remote:        Installing nokogiri 1.12.4 (x86_64-linux)
// remote:        Fetching rb-inotify 0.10.1
// remote:        Installing rb-inotify 0.10.1
// remote:        Fetching rails_12factor 0.0.3
// remote:        Installing rails_12factor 0.0.3
// remote:        Fetching turbolinks 5.2.1
// remote:        Installing turbolinks 5.2.1
// remote:        Fetching activesupport 4.2.9
// remote:        Installing activesupport 4.2.9
// remote:        Fetching loofah 2.12.0
// remote:        Installing loofah 2.12.0
// remote:        Fetching sass-listen 4.0.0
// remote:        Installing sass-listen 4.0.0
// remote:        Fetching rails-deprecated_sanitizer 1.0.4
// remote:        Installing rails-deprecated_sanitizer 1.0.4
// remote:        Fetching globalid 0.4.2
// remote:        Installing globalid 0.4.2
// remote:        Fetching activemodel 4.2.9
// remote:        Installing activemodel 4.2.9
// remote:        Fetching jbuilder 2.9.1
// remote:        Installing jbuilder 2.9.1
// remote:        Fetching rails-html-sanitizer 1.4.2
// remote:        Installing rails-html-sanitizer 1.4.2
// remote:        Fetching sass 3.7.4
// remote:        Installing sass 3.7.4
// remote:        Fetching rails-dom-testing 1.0.9
// remote:        Installing rails-dom-testing 1.0.9
// remote:        Fetching activejob 4.2.9
// remote:        Installing activejob 4.2.9
// remote:        Fetching activerecord 4.2.9
// remote:        Installing activerecord 4.2.9
// remote:        Fetching actionview 4.2.9
// remote:        Installing actionview 4.2.9
// remote:        Fetching actionpack 4.2.9
// remote:        Installing actionpack 4.2.9
// remote:        Fetching actionmailer 4.2.9
// remote:        Installing actionmailer 4.2.9
// remote:        Fetching railties 4.2.9
// remote:        Installing railties 4.2.9
// remote:        Fetching sprockets-rails 3.2.2
// remote:        Installing sprockets-rails 3.2.2
// remote:        Fetching coffee-rails 4.1.1
// remote:        Installing coffee-rails 4.1.1
// remote:        Fetching jquery-rails 4.4.0
// remote:        Installing jquery-rails 4.4.0
// remote:        Fetching rails 4.2.9
// remote:        Installing rails 4.2.9
// remote:        Fetching sass-rails 5.0.7
// remote:        Installing sass-rails 5.0.7
// remote:        Fetching sdoc 0.4.2
// remote:        Installing sdoc 0.4.2
// remote:        Bundle complete! 18 Gemfile dependencies, 60 gems now installed.
// remote:        Gems in the groups development and test were not installed.
// remote:        Bundled gems are installed into `./vendor/bundle`
// remote:        Post-install message from sass:
// remote:        
// remote:        Ruby Sass has reached end-of-life and should no longer be used.
// remote:        
// remote:        * If you use Sass as a command-line tool, we recommend using Dart Sass, the new
// remote:          primary implementation: https://sass-lang.com/install
// remote:        
// remote:        * If you use Sass as a plug-in for a Ruby web framework, we recommend using the
// remote:          sassc gem: https://github.com/sass/sassc-ruby#readme
// remote:        
// remote:        * For more details, please refer to the Sass blog:
// remote:          https://sass-lang.com/blog/posts/7828841
// remote:        
// remote:        Bundle completed (32.89s)
// remote:        Cleaning up the bundler cache.
// remote: -----> Installing node-v12.16.2-linux-x64
// remote:        Detected manifest file, assuming assets were compiled locally
// remote: -----> Detecting rails configuration
// remote: -----> Detecting rake tasks
// remote: 
// remote: ###### WARNING:
// remote: 
// remote:        There is a more recent Ruby version available for you to use:
// remote:        
// remote:        2.6.8
// remote:        
// remote:        The latest version will include security and bug fixes. We always recommend
// remote:        running the latest version of your minor release.
// remote:        
// remote:        Please upgrade your Ruby version.
// remote:        
// remote:        For all available Ruby versions see:
// remote:          https://devcenter.heroku.com/articles/ruby-support#supported-runtimes
// remote: 
// remote: ###### WARNING:
// remote: 
// remote:        No Procfile detected, using the default web server.
// remote:        We recommend explicitly declaring how to boot your server process via a Procfile.
// remote:        https://devcenter.heroku.com/articles/ruby-default-web-server
// remote: 
// remote: 
// remote: -----> Discovering process types
// remote:        Procfile declares types     -> (none)
// remote:        Default types for buildpack -> console, rake, web
// remote: 
// remote: -----> Compressing...
// remote:        Done: 47.6M
// remote: -----> Launching...
// remote:        Released v6
// remote:        https://afternoon-beyond-72366.herokuapp.com/ deployed to Heroku
// remote: 
// remote: Verifying deploy... done.
// To https://git.heroku.com/afternoon-beyond-72366.git
//  * [new branch]      master -> master
// vagrant@vagrant-ubuntu-trusty-64:/vagrant/prana_proto_postgresql/prana$ heroku logs
// 2021-09-21T20:10:40.945604+00:00 app[web.1]: The PGconn, PGresult, and PGError constants are deprecated, and will be
// 2021-09-21T20:10:40.945605+00:00 app[web.1]: removed as of version 1.0.
// 2021-09-21T20:10:40.945614+00:00 app[web.1]: 
// 2021-09-21T20:10:40.945614+00:00 app[web.1]: You should use PG::Connection, PG::Result, and PG::Error instead, respectively.
// 2021-09-21T20:10:40.945614+00:00 app[web.1]: 
// 2021-09-21T20:10:40.945617+00:00 app[web.1]: Called from /app/vendor/bundle/ruby/2.6.0/gems/activesupport-4.2.9/lib/active_support/dependencies.rb:240:in `load_dependency'
// 2021-09-21T20:10:41.023064+00:00 app[web.1]: Processing by AsanasController#index as HTML
// 2021-09-21T20:10:41.036045+00:00 app[web.1]: Rendered asanas/index.html.erb within layouts/asanas (0.5ms)
// 2021-09-21T20:10:41.037928+00:00 app[web.1]: Rendered shared/_navbar.html.erb (0.2ms)
// 2021-09-21T20:10:41.038754+00:00 heroku[router]: at=info method=GET path="/" host=afternoon-beyond-72366.herokuapp.com request_id=b479ba1f-5975-4312-bc93-6909e86ca4ee fwd="76.185.114.198" dyno=web.1 connect=0ms service=101ms status=200 bytes=7773 protocol=https
// 2021-09-21T20:10:41.038808+00:00 app[web.1]: Rendered shared/_copyright.html.erb (0.4ms)
// 2021-09-21T20:10:41.039702+00:00 app[web.1]: Rendered shared/_ascii_sig.html.erb (0.4ms)
// 2021-09-21T20:10:41.039960+00:00 app[web.1]: Completed 200 OK in 16ms (Views: 9.4ms | ActiveRecord: 0.0ms)
// 2021-09-21T20:10:41.349991+00:00 heroku[router]: at=info method=GET path="/assets/application-05214884b1e0fbe30126253a605e97f518c179a3e0a3788f9b5222ca835261eb.css" host=afternoon-beyond-72366.herokuapp.com request_id=18369260-1738-451d-a47a-814c925f1a66 fwd="76.185.114.198" dyno=web.1 connect=0ms service=1ms status=200 bytes=24379 protocol=https
// 2021-09-21T20:10:41.367161+00:00 heroku[router]: at=info method=GET path="/assets/application-5c8338e895ff505b4e7b2d7f8335e338629ef82619661118d95fd3ad0d0e3162.js" host=afternoon-beyond-72366.herokuapp.com request_id=8c1a8572-cdf3-46c3-bb04-796d5b47f196 fwd="76.185.114.198" dyno=web.1 connect=0ms service=5ms status=200 bytes=117107 protocol=https
// 2021-09-21T20:10:41.625399+00:00 heroku[router]: at=info method=GET path="/favicon.ico" host=afternoon-beyond-72366.herokuapp.com request_id=79e22cef-b19e-4be6-9532-b797fd4aad2f fwd="76.185.114.198" dyno=web.1 connect=0ms service=1ms status=200 bytes=228 protocol=https
// 2021-09-21T20:10:51.236983+00:00 app[web.1]: Started GET "/asanas/show/all" for 76.185.114.198 at 2021-09-21 20:10:51 +0000
// 2021-09-21T20:10:51.239616+00:00 app[web.1]: Processing by AsanasController#show_all as HTML
// 2021-09-21T20:10:51.243285+00:00 heroku[router]: at=info method=GET path="/asanas/show/all" host=afternoon-beyond-72366.herokuapp.com request_id=74105bd0-256e-4a98-863c-ec4621a29464 fwd="76.185.114.198" dyno=web.1 connect=0ms service=9ms status=500 bytes=1754 protocol=https
// 2021-09-21T20:10:51.243577+00:00 app[web.1]: Asana Load (1.8ms)  SELECT "asanas".* FROM "asanas"
// 2021-09-21T20:10:51.243934+00:00 app[web.1]: Rendered shared/_table_show_all.html.erb (2.9ms)
// 2021-09-21T20:10:51.243970+00:00 app[web.1]: Rendered asanas/show_all.html.erb within layouts/asanas (3.5ms)
// 2021-09-21T20:10:51.244069+00:00 app[web.1]: Completed 500 Internal Server Error in 4ms (ActiveRecord: 1.8ms)
// 2021-09-21T20:10:51.244714+00:00 app[web.1]: 
// 2021-09-21T20:10:51.244714+00:00 app[web.1]: ActionView::Template::Error (PG::UndefinedTable: ERROR:  relation "asanas" does not exist
// 2021-09-21T20:10:51.244715+00:00 app[web.1]: LINE 1: SELECT "asanas".* FROM "asanas"
// 2021-09-21T20:10:51.244715+00:00 app[web.1]: ^
// 2021-09-21T20:10:51.244716+00:00 app[web.1]: : SELECT "asanas".* FROM "asanas"):
// 2021-09-21T20:10:51.244716+00:00 app[web.1]: 17:             </tr>
// 2021-09-21T20:10:51.244716+00:00 app[web.1]: 18:         </thead>
// 2021-09-21T20:10:51.244717+00:00 app[web.1]: 19:         <tbody>
// 2021-09-21T20:10:51.244718+00:00 app[web.1]: 20:         <% @asanas.each do |asana| %>
// 2021-09-21T20:10:51.244718+00:00 app[web.1]: 21:             <tr>
// 2021-09-21T20:10:51.244718+00:00 app[web.1]: 22:                 <td>
// 2021-09-21T20:10:51.244718+00:00 app[web.1]: 23:                 <a href="/asanas/<%= asana.id%>" class="link-info">
// 2021-09-21T20:10:51.244722+00:00 app[web.1]: app/views/shared/_table_show_all.html.erb:20:in `_app_views_shared__table_show_all_html_erb__4469153199849558570_47349942052920'
// 2021-09-21T20:10:51.244723+00:00 app[web.1]: app/views/asanas/show_all.html.erb:2:in `_app_views_asanas_show_all_html_erb___197099372963520789_47349942012140'
// 2021-09-21T20:10:51.244724+00:00 app[web.1]: 
// 2021-09-21T20:10:51.244724+00:00 app[web.1]: 
// 2021-09-21T20:11:00.168696+00:00 heroku[router]: at=info method=GET path="/assets/application-05214884b1e0fbe30126253a605e97f518c179a3e0a3788f9b5222ca835261eb.css" host=afternoon-beyond-72366.herokuapp.com request_id=14d18345-328d-4473-bb02-0b97d2c0e919 fwd="76.185.114.198" dyno=web.1 connect=0ms service=1ms status=304 bytes=133 protocol=https
// 2021-09-21T20:11:00.172197+00:00 heroku[router]: at=info method=GET path="/assets/application-5c8338e895ff505b4e7b2d7f8335e338629ef82619661118d95fd3ad0d0e3162.js" host=afternoon-beyond-72366.herokuapp.com request_id=29802235-8a62-4f84-ae0d-14bdfc3fe953 fwd="76.185.114.198" dyno=web.1 connect=0ms service=1ms status=304 bytes=133 protocol=https
// 2021-09-21T20:11:00.225215+00:00 heroku[router]: at=info method=GET path="/favicon.ico" host=afternoon-beyond-72366.herokuapp.com request_id=719143f9-3d48-4f41-8d21-68f98601afae fwd="76.185.114.198" dyno=web.1 connect=0ms service=2ms status=304 bytes=133 protocol=https
// 2021-09-21T20:11:01.499603+00:00 app[web.1]: Started GET "/asanas/show/all" for 76.185.114.198 at 2021-09-21 20:11:01 +0000
// 2021-09-21T20:11:01.501236+00:00 app[web.1]: Processing by AsanasController#show_all as HTML
// 2021-09-21T20:11:01.502720+00:00 heroku[router]: at=info method=GET path="/asanas/show/all" host=afternoon-beyond-72366.herokuapp.com request_id=5a122cea-eae3-43ef-9527-42eda8fda977 fwd="76.185.114.198" dyno=web.1 connect=0ms service=6ms status=500 bytes=1754 protocol=https
// 2021-09-21T20:11:01.503071+00:00 app[web.1]: Asana Load (1.0ms)  SELECT "asanas".* FROM "asanas"
// 2021-09-21T20:11:01.503441+00:00 app[web.1]: Rendered shared/_table_show_all.html.erb (1.6ms)
// 2021-09-21T20:11:01.503475+00:00 app[web.1]: Rendered asanas/show_all.html.erb within layouts/asanas (1.7ms)
// 2021-09-21T20:11:01.503565+00:00 app[web.1]: Completed 500 Internal Server Error in 2ms (ActiveRecord: 1.0ms)
// 2021-09-21T20:11:01.504198+00:00 app[web.1]: 
// 2021-09-21T20:11:01.504199+00:00 app[web.1]: ActionView::Template::Error (PG::UndefinedTable: ERROR:  relation "asanas" does not exist
// 2021-09-21T20:11:01.504200+00:00 app[web.1]: LINE 1: SELECT "asanas".* FROM "asanas"
// 2021-09-21T20:11:01.504200+00:00 app[web.1]: ^
// 2021-09-21T20:11:01.504200+00:00 app[web.1]: : SELECT "asanas".* FROM "asanas"):
// 2021-09-21T20:11:01.504201+00:00 app[web.1]: 17:             </tr>
// 2021-09-21T20:11:01.504201+00:00 app[web.1]: 18:         </thead>
// 2021-09-21T20:11:01.504201+00:00 app[web.1]: 19:         <tbody>
// 2021-09-21T20:11:01.504201+00:00 app[web.1]: 20:         <% @asanas.each do |asana| %>
// 2021-09-21T20:11:01.504202+00:00 app[web.1]: 21:             <tr>
// 2021-09-21T20:11:01.504202+00:00 app[web.1]: 22:                 <td>
// 2021-09-21T20:11:01.504202+00:00 app[web.1]: 23:                 <a href="/asanas/<%= asana.id%>" class="link-info">
// 2021-09-21T20:11:01.504203+00:00 app[web.1]: app/views/shared/_table_show_all.html.erb:20:in `_app_views_shared__table_show_all_html_erb__4469153199849558570_47349942052920'
// 2021-09-21T20:11:01.504216+00:00 app[web.1]: app/views/asanas/show_all.html.erb:2:in `_app_views_asanas_show_all_html_erb___197099372963520789_47349942012140'
// 2021-09-21T20:11:01.504216+00:00 app[web.1]: 
// 2021-09-21T20:11:01.504216+00:00 app[web.1]: 
// 2021-09-21T20:11:02.496594+00:00 app[web.1]: Started GET "/" for 76.185.114.198 at 2021-09-21 20:11:02 +0000
// 2021-09-21T20:11:02.498298+00:00 app[web.1]: Processing by AsanasController#index as HTML
// 2021-09-21T20:11:02.499049+00:00 heroku[router]: at=info method=GET path="/" host=afternoon-beyond-72366.herokuapp.com request_id=9bc85eef-4314-464d-9cc9-086a8040749c fwd="76.185.114.198" dyno=web.1 connect=0ms service=6ms status=200 bytes=7773 protocol=https
// 2021-09-21T20:11:02.499070+00:00 app[web.1]: Rendered asanas/index.html.erb within layouts/asanas (0.0ms)
// 2021-09-21T20:11:02.499602+00:00 app[web.1]: Rendered shared/_navbar.html.erb (0.0ms)
// 2021-09-21T20:11:02.499724+00:00 app[web.1]: Rendered shared/_copyright.html.erb (0.0ms)
// 2021-09-21T20:11:02.499817+00:00 app[web.1]: Rendered shared/_ascii_sig.html.erb (0.0ms)
// 2021-09-21T20:11:02.499965+00:00 app[web.1]: Completed 200 OK in 2ms (Views: 1.1ms | ActiveRecord: 0.0ms)
// 2021-09-21T20:11:03.355548+00:00 app[web.1]: Started GET "/asanas/new" for 76.185.114.198 at 2021-09-21 20:11:03 +0000
// 2021-09-21T20:11:03.357208+00:00 app[web.1]: Processing by AsanasController#new as HTML
// 2021-09-21T20:11:03.359277+00:00 app[web.1]: Rendered asanas/new.html.erb within layouts/asanas (1.0ms)
// 2021-09-21T20:11:03.359770+00:00 heroku[router]: at=info method=GET path="/asanas/new" host=afternoon-beyond-72366.herokuapp.com request_id=98993664-f65d-484a-a033-c6ad93ef32d5 fwd="76.185.114.198" dyno=web.1 connect=0ms service=7ms status=200 bytes=21446 protocol=https
// 2021-09-21T20:11:03.359802+00:00 app[web.1]: Rendered shared/_navbar.html.erb (0.0ms)
// 2021-09-21T20:11:03.359944+00:00 app[web.1]: Rendered shared/_copyright.html.erb (0.0ms)
// 2021-09-21T20:11:03.360057+00:00 app[web.1]: Rendered shared/_ascii_sig.html.erb (0.0ms)
// 2021-09-21T20:11:03.360204+00:00 app[web.1]: Completed 200 OK in 3ms (Views: 2.5ms | ActiveRecord: 0.0ms)
// 2021-09-21T20:11:06.690422+00:00 app[web.1]: Started GET "/searches/new" for 76.185.114.198 at 2021-09-21 20:11:06 +0000
// 2021-09-21T20:11:06.693298+00:00 app[web.1]: Processing by SearchesController#new as HTML
// 2021-09-21T20:11:06.696196+00:00 heroku[router]: at=info method=GET path="/searches/new" host=afternoon-beyond-72366.herokuapp.com request_id=3cbc7d0f-ed06-42a2-8332-e40600fab89e fwd="76.185.114.198" dyno=web.1 connect=0ms service=9ms status=500 bytes=1754 protocol=https
// 2021-09-21T20:11:06.697183+00:00 app[web.1]: Completed 500 Internal Server Error in 4ms (ActiveRecord: 3.1ms)
// 2021-09-21T20:11:06.697600+00:00 app[web.1]: 
// 2021-09-21T20:11:06.697600+00:00 app[web.1]: ActiveRecord::StatementInvalid (PG::UndefinedTable: ERROR:  relation "searches" does not exist
// 2021-09-21T20:11:06.697601+00:00 app[web.1]: LINE 5:                WHERE a.attrelid = '"searches"'::regclass
// 2021-09-21T20:11:06.697601+00:00 app[web.1]: ^
// 2021-09-21T20:11:06.697602+00:00 app[web.1]: :               SELECT a.attname, format_type(a.atttypid, a.atttypmod),
// 2021-09-21T20:11:06.697602+00:00 app[web.1]: pg_get_expr(d.adbin, d.adrelid), a.attnotnull, a.atttypid, a.atttypmod
// 2021-09-21T20:11:06.697602+00:00 app[web.1]: FROM pg_attribute a LEFT JOIN pg_attrdef d
// 2021-09-21T20:11:06.697603+00:00 app[web.1]: ON a.attrelid = d.adrelid AND a.attnum = d.adnum
// 2021-09-21T20:11:06.697603+00:00 app[web.1]: WHERE a.attrelid = '"searches"'::regclass
// 2021-09-21T20:11:06.697603+00:00 app[web.1]: AND a.attnum > 0 AND NOT a.attisdropped
// 2021-09-21T20:11:06.697603+00:00 app[web.1]: ORDER BY a.attnum
// 2021-09-21T20:11:06.697604+00:00 app[web.1]: ):
// 2021-09-21T20:11:06.697604+00:00 app[web.1]: app/controllers/searches_controller.rb:5:in `new'
// 2021-09-21T20:11:06.697604+00:00 app[web.1]: 
// 2021-09-21T20:11:06.697605+00:00 app[web.1]: 
// vagrant@vagrant-ubuntu-trusty-64:/vagrant/prana_proto_postgresql/prana$ rails s -b 0.0.0.0
// /home/vagrant/.rvm/gems/ruby-2.6.6/gems/activesupport-4.2.9/lib/active_support/core_ext/object/duplicable.rb:111: warning: BigDecimal.new is deprecated; use BigDecimal() method instead.
// => Booting WEBrick
// => Rails 4.2.9 application starting in development on http://0.0.0.0:3000
// => Run `rails server -h` for more startup options
// => Ctrl-C to shutdown server
// [2021-09-21 20:11:19] INFO  WEBrick 1.4.2
// [2021-09-21 20:11:19] INFO  ruby 2.6.6 (2020-03-31) [x86_64-linux]
// [2021-09-21 20:11:19] INFO  WEBrick::HTTPServer#start: pid=3165 port=3000


// Started GET "/searches/new" for 10.0.2.2 at 2021-09-21 20:11:21 +0000
// Cannot render console from 10.0.2.2! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
// The PGconn, PGresult, and PGError constants are deprecated, and will be
// removed as of version 1.0.

// You should use PG::Connection, PG::Result, and PG::Error instead, respectively.

// Called from /home/vagrant/.rvm/gems/ruby-2.6.6/gems/activesupport-4.2.9/lib/active_support/dependencies.rb:240:in `load_dependency'
//   ActiveRecord::SchemaMigration Load (0.6ms)  SELECT "schema_migrations".* FROM "schema_migrations"
// Processing by SearchesController#new as HTML
//   Rendered searches/new.html.erb within layouts/asanas (38.6ms)
//   Rendered shared/_navbar.html.erb (0.3ms)
//   Rendered shared/_copyright.html.erb (0.4ms)
//   Rendered shared/_ascii_sig.html.erb (0.4ms)
// Completed 200 OK in 647ms (Views: 608.1ms | ActiveRecord: 3.7ms)


// Started GET "/asanas" for 10.0.2.2 at 2021-09-21 20:11:23 +0000
// Cannot render console from 10.0.2.2! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
// Processing by AsanasController#index as HTML
//   Rendered asanas/index.html.erb within layouts/asanas (0.3ms)
//   Rendered shared/_navbar.html.erb (0.1ms)
//   Rendered shared/_copyright.html.erb (0.1ms)
//   Rendered shared/_ascii_sig.html.erb (0.1ms)
// Completed 200 OK in 152ms (Views: 138.8ms | ActiveRecord: 0.0ms)


// Started GET "/asanas/show/all" for 10.0.2.2 at 2021-09-21 20:11:25 +0000
// Cannot render console from 10.0.2.2! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
// Processing by AsanasController#show_all as HTML
//   Asana Load (0.4ms)  SELECT "asanas".* FROM "asanas"
//   Rendered shared/_table_show_all.html.erb (7.2ms)
//   Rendered asanas/show_all.html.erb within layouts/asanas (19.8ms)
//   Rendered shared/_navbar.html.erb (0.1ms)
//   Rendered shared/_copyright.html.erb (0.1ms)
//   Rendered shared/_ascii_sig.html.erb (0.1ms)
// Completed 200 OK in 180ms (Views: 177.8ms | ActiveRecord: 1.3ms)


// Started GET "/asanas/3" for 10.0.2.2 at 2021-09-21 20:11:28 +0000
// Cannot render console from 10.0.2.2! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
// Processing by AsanasController#show as HTML
//   Parameters: {"id"=>"3"}
//   Asana Load (0.2ms)  SELECT  "asanas".* FROM "asanas" WHERE "asanas"."id" = $1 LIMIT 1  [["id", 3]]
//   Rendered asanas/show.html.erb within layouts/asanas (0.5ms)
//   Rendered shared/_navbar.html.erb (0.0ms)
//   Rendered shared/_copyright.html.erb (0.1ms)
//   Rendered shared/_ascii_sig.html.erb (0.1ms)
// Completed 200 OK in 171ms (Views: 149.7ms | ActiveRecord: 0.4ms)


// Started GET "/asanas/new" for 10.0.2.2 at 2021-09-21 20:11:29 +0000
// Cannot render console from 10.0.2.2! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
// Processing by AsanasController#new as HTML
//   Rendered asanas/new.html.erb within layouts/asanas (0.9ms)
//   Rendered shared/_navbar.html.erb (0.0ms)
//   Rendered shared/_copyright.html.erb (0.1ms)
//   Rendered shared/_ascii_sig.html.erb (0.0ms)
// Completed 200 OK in 186ms (Views: 185.2ms | ActiveRecord: 0.0ms)


// Started GET "/searches/new" for 10.0.2.2 at 2021-09-21 20:11:31 +0000
// Cannot render console from 10.0.2.2! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
// Processing by SearchesController#new as HTML
//   Rendered searches/new.html.erb within layouts/asanas (1.6ms)
//   Rendered shared/_navbar.html.erb (0.1ms)
//   Rendered shared/_copyright.html.erb (0.0ms)
//   Rendered shared/_ascii_sig.html.erb (0.0ms)
// Completed 200 OK in 201ms (Views: 200.6ms | ActiveRecord: 0.0ms)
// ^C[2021-09-21 20:11:56] INFO  going to shutdown ...
// [2021-09-21 20:11:57] INFO  WEBrick::HTTPServer#start done.
// Exiting
// vagrant@vagrant-ubuntu-trusty-64:/vagrant/prana_proto_postgresql/prana$ heroku logs
// 2021-09-21T20:10:40.945604+00:00 app[web.1]: The PGconn, PGresult, and PGError constants are deprecated, and will be
// 2021-09-21T20:10:40.945605+00:00 app[web.1]: removed as of version 1.0.
// 2021-09-21T20:10:40.945614+00:00 app[web.1]: 
// 2021-09-21T20:10:40.945614+00:00 app[web.1]: You should use PG::Connection, PG::Result, and PG::Error instead, respectively.
// 2021-09-21T20:10:40.945614+00:00 app[web.1]: 
// 2021-09-21T20:10:40.945617+00:00 app[web.1]: Called from /app/vendor/bundle/ruby/2.6.0/gems/activesupport-4.2.9/lib/active_support/dependencies.rb:240:in `load_dependency'
// 2021-09-21T20:10:41.023064+00:00 app[web.1]: Processing by AsanasController#index as HTML
// 2021-09-21T20:10:41.036045+00:00 app[web.1]: Rendered asanas/index.html.erb within layouts/asanas (0.5ms)
// 2021-09-21T20:10:41.037928+00:00 app[web.1]: Rendered shared/_navbar.html.erb (0.2ms)
// 2021-09-21T20:10:41.038754+00:00 heroku[router]: at=info method=GET path="/" host=afternoon-beyond-72366.herokuapp.com request_id=b479ba1f-5975-4312-bc93-6909e86ca4ee fwd="76.185.114.198" dyno=web.1 connect=0ms service=101ms status=200 bytes=7773 protocol=https
// 2021-09-21T20:10:41.038808+00:00 app[web.1]: Rendered shared/_copyright.html.erb (0.4ms)
// 2021-09-21T20:10:41.039702+00:00 app[web.1]: Rendered shared/_ascii_sig.html.erb (0.4ms)
// 2021-09-21T20:10:41.039960+00:00 app[web.1]: Completed 200 OK in 16ms (Views: 9.4ms | ActiveRecord: 0.0ms)
// 2021-09-21T20:10:41.349991+00:00 heroku[router]: at=info method=GET path="/assets/application-05214884b1e0fbe30126253a605e97f518c179a3e0a3788f9b5222ca835261eb.css" host=afternoon-beyond-72366.herokuapp.com request_id=18369260-1738-451d-a47a-814c925f1a66 fwd="76.185.114.198" dyno=web.1 connect=0ms service=1ms status=200 bytes=24379 protocol=https
// 2021-09-21T20:10:41.367161+00:00 heroku[router]: at=info method=GET path="/assets/application-5c8338e895ff505b4e7b2d7f8335e338629ef82619661118d95fd3ad0d0e3162.js" host=afternoon-beyond-72366.herokuapp.com request_id=8c1a8572-cdf3-46c3-bb04-796d5b47f196 fwd="76.185.114.198" dyno=web.1 connect=0ms service=5ms status=200 bytes=117107 protocol=https
// 2021-09-21T20:10:41.625399+00:00 heroku[router]: at=info method=GET path="/favicon.ico" host=afternoon-beyond-72366.herokuapp.com request_id=79e22cef-b19e-4be6-9532-b797fd4aad2f fwd="76.185.114.198" dyno=web.1 connect=0ms service=1ms status=200 bytes=228 protocol=https
// 2021-09-21T20:10:51.236983+00:00 app[web.1]: Started GET "/asanas/show/all" for 76.185.114.198 at 2021-09-21 20:10:51 +0000
// 2021-09-21T20:10:51.239616+00:00 app[web.1]: Processing by AsanasController#show_all as HTML
// 2021-09-21T20:10:51.243285+00:00 heroku[router]: at=info method=GET path="/asanas/show/all" host=afternoon-beyond-72366.herokuapp.com request_id=74105bd0-256e-4a98-863c-ec4621a29464 fwd="76.185.114.198" dyno=web.1 connect=0ms service=9ms status=500 bytes=1754 protocol=https
// 2021-09-21T20:10:51.243577+00:00 app[web.1]: Asana Load (1.8ms)  SELECT "asanas".* FROM "asanas"
// 2021-09-21T20:10:51.243934+00:00 app[web.1]: Rendered shared/_table_show_all.html.erb (2.9ms)
// 2021-09-21T20:10:51.243970+00:00 app[web.1]: Rendered asanas/show_all.html.erb within layouts/asanas (3.5ms)
// 2021-09-21T20:10:51.244069+00:00 app[web.1]: Completed 500 Internal Server Error in 4ms (ActiveRecord: 1.8ms)
// 2021-09-21T20:10:51.244714+00:00 app[web.1]: 
// 2021-09-21T20:10:51.244714+00:00 app[web.1]: ActionView::Template::Error (PG::UndefinedTable: ERROR:  relation "asanas" does not exist
// 2021-09-21T20:10:51.244715+00:00 app[web.1]: LINE 1: SELECT "asanas".* FROM "asanas"
// 2021-09-21T20:10:51.244715+00:00 app[web.1]: ^
// 2021-09-21T20:10:51.244716+00:00 app[web.1]: : SELECT "asanas".* FROM "asanas"):
// 2021-09-21T20:10:51.244716+00:00 app[web.1]: 17:             </tr>
// 2021-09-21T20:10:51.244716+00:00 app[web.1]: 18:         </thead>
// 2021-09-21T20:10:51.244717+00:00 app[web.1]: 19:         <tbody>
// 2021-09-21T20:10:51.244718+00:00 app[web.1]: 20:         <% @asanas.each do |asana| %>
// 2021-09-21T20:10:51.244718+00:00 app[web.1]: 21:             <tr>
// 2021-09-21T20:10:51.244718+00:00 app[web.1]: 22:                 <td>
// 2021-09-21T20:10:51.244718+00:00 app[web.1]: 23:                 <a href="/asanas/<%= asana.id%>" class="link-info">
// 2021-09-21T20:10:51.244722+00:00 app[web.1]: app/views/shared/_table_show_all.html.erb:20:in `_app_views_shared__table_show_all_html_erb__4469153199849558570_47349942052920'
// 2021-09-21T20:10:51.244723+00:00 app[web.1]: app/views/asanas/show_all.html.erb:2:in `_app_views_asanas_show_all_html_erb___197099372963520789_47349942012140'
// 2021-09-21T20:10:51.244724+00:00 app[web.1]: 
// 2021-09-21T20:10:51.244724+00:00 app[web.1]: 
// 2021-09-21T20:11:00.168696+00:00 heroku[router]: at=info method=GET path="/assets/application-05214884b1e0fbe30126253a605e97f518c179a3e0a3788f9b5222ca835261eb.css" host=afternoon-beyond-72366.herokuapp.com request_id=14d18345-328d-4473-bb02-0b97d2c0e919 fwd="76.185.114.198" dyno=web.1 connect=0ms service=1ms status=304 bytes=133 protocol=https
// 2021-09-21T20:11:00.172197+00:00 heroku[router]: at=info method=GET path="/assets/application-5c8338e895ff505b4e7b2d7f8335e338629ef82619661118d95fd3ad0d0e3162.js" host=afternoon-beyond-72366.herokuapp.com request_id=29802235-8a62-4f84-ae0d-14bdfc3fe953 fwd="76.185.114.198" dyno=web.1 connect=0ms service=1ms status=304 bytes=133 protocol=https
// 2021-09-21T20:11:00.225215+00:00 heroku[router]: at=info method=GET path="/favicon.ico" host=afternoon-beyond-72366.herokuapp.com request_id=719143f9-3d48-4f41-8d21-68f98601afae fwd="76.185.114.198" dyno=web.1 connect=0ms service=2ms status=304 bytes=133 protocol=https
// 2021-09-21T20:11:01.499603+00:00 app[web.1]: Started GET "/asanas/show/all" for 76.185.114.198 at 2021-09-21 20:11:01 +0000
// 2021-09-21T20:11:01.501236+00:00 app[web.1]: Processing by AsanasController#show_all as HTML
// 2021-09-21T20:11:01.502720+00:00 heroku[router]: at=info method=GET path="/asanas/show/all" host=afternoon-beyond-72366.herokuapp.com request_id=5a122cea-eae3-43ef-9527-42eda8fda977 fwd="76.185.114.198" dyno=web.1 connect=0ms service=6ms status=500 bytes=1754 protocol=https
// 2021-09-21T20:11:01.503071+00:00 app[web.1]: Asana Load (1.0ms)  SELECT "asanas".* FROM "asanas"
// 2021-09-21T20:11:01.503441+00:00 app[web.1]: Rendered shared/_table_show_all.html.erb (1.6ms)
// 2021-09-21T20:11:01.503475+00:00 app[web.1]: Rendered asanas/show_all.html.erb within layouts/asanas (1.7ms)
// 2021-09-21T20:11:01.503565+00:00 app[web.1]: Completed 500 Internal Server Error in 2ms (ActiveRecord: 1.0ms)
// 2021-09-21T20:11:01.504198+00:00 app[web.1]: 
// 2021-09-21T20:11:01.504199+00:00 app[web.1]: ActionView::Template::Error (PG::UndefinedTable: ERROR:  relation "asanas" does not exist
// 2021-09-21T20:11:01.504200+00:00 app[web.1]: LINE 1: SELECT "asanas".* FROM "asanas"
// 2021-09-21T20:11:01.504200+00:00 app[web.1]: ^
// 2021-09-21T20:11:01.504200+00:00 app[web.1]: : SELECT "asanas".* FROM "asanas"):
// 2021-09-21T20:11:01.504201+00:00 app[web.1]: 17:             </tr>
// 2021-09-21T20:11:01.504201+00:00 app[web.1]: 18:         </thead>
// 2021-09-21T20:11:01.504201+00:00 app[web.1]: 19:         <tbody>
// 2021-09-21T20:11:01.504201+00:00 app[web.1]: 20:         <% @asanas.each do |asana| %>
// 2021-09-21T20:11:01.504202+00:00 app[web.1]: 21:             <tr>
// 2021-09-21T20:11:01.504202+00:00 app[web.1]: 22:                 <td>
// 2021-09-21T20:11:01.504202+00:00 app[web.1]: 23:                 <a href="/asanas/<%= asana.id%>" class="link-info">
// 2021-09-21T20:11:01.504203+00:00 app[web.1]: app/views/shared/_table_show_all.html.erb:20:in `_app_views_shared__table_show_all_html_erb__4469153199849558570_47349942052920'
// 2021-09-21T20:11:01.504216+00:00 app[web.1]: app/views/asanas/show_all.html.erb:2:in `_app_views_asanas_show_all_html_erb___197099372963520789_47349942012140'
// 2021-09-21T20:11:01.504216+00:00 app[web.1]: 
// 2021-09-21T20:11:01.504216+00:00 app[web.1]: 
// 2021-09-21T20:11:02.496594+00:00 app[web.1]: Started GET "/" for 76.185.114.198 at 2021-09-21 20:11:02 +0000
// 2021-09-21T20:11:02.498298+00:00 app[web.1]: Processing by AsanasController#index as HTML
// 2021-09-21T20:11:02.499049+00:00 heroku[router]: at=info method=GET path="/" host=afternoon-beyond-72366.herokuapp.com request_id=9bc85eef-4314-464d-9cc9-086a8040749c fwd="76.185.114.198" dyno=web.1 connect=0ms service=6ms status=200 bytes=7773 protocol=https
// 2021-09-21T20:11:02.499070+00:00 app[web.1]: Rendered asanas/index.html.erb within layouts/asanas (0.0ms)
// 2021-09-21T20:11:02.499602+00:00 app[web.1]: Rendered shared/_navbar.html.erb (0.0ms)
// 2021-09-21T20:11:02.499724+00:00 app[web.1]: Rendered shared/_copyright.html.erb (0.0ms)
// 2021-09-21T20:11:02.499817+00:00 app[web.1]: Rendered shared/_ascii_sig.html.erb (0.0ms)
// 2021-09-21T20:11:02.499965+00:00 app[web.1]: Completed 200 OK in 2ms (Views: 1.1ms | ActiveRecord: 0.0ms)
// 2021-09-21T20:11:03.355548+00:00 app[web.1]: Started GET "/asanas/new" for 76.185.114.198 at 2021-09-21 20:11:03 +0000
// 2021-09-21T20:11:03.357208+00:00 app[web.1]: Processing by AsanasController#new as HTML
// 2021-09-21T20:11:03.359277+00:00 app[web.1]: Rendered asanas/new.html.erb within layouts/asanas (1.0ms)
// 2021-09-21T20:11:03.359770+00:00 heroku[router]: at=info method=GET path="/asanas/new" host=afternoon-beyond-72366.herokuapp.com request_id=98993664-f65d-484a-a033-c6ad93ef32d5 fwd="76.185.114.198" dyno=web.1 connect=0ms service=7ms status=200 bytes=21446 protocol=https
// 2021-09-21T20:11:03.359802+00:00 app[web.1]: Rendered shared/_navbar.html.erb (0.0ms)
// 2021-09-21T20:11:03.359944+00:00 app[web.1]: Rendered shared/_copyright.html.erb (0.0ms)
// 2021-09-21T20:11:03.360057+00:00 app[web.1]: Rendered shared/_ascii_sig.html.erb (0.0ms)
// 2021-09-21T20:11:03.360204+00:00 app[web.1]: Completed 200 OK in 3ms (Views: 2.5ms | ActiveRecord: 0.0ms)
// 2021-09-21T20:11:06.690422+00:00 app[web.1]: Started GET "/searches/new" for 76.185.114.198 at 2021-09-21 20:11:06 +0000
// 2021-09-21T20:11:06.693298+00:00 app[web.1]: Processing by SearchesController#new as HTML
// 2021-09-21T20:11:06.696196+00:00 heroku[router]: at=info method=GET path="/searches/new" host=afternoon-beyond-72366.herokuapp.com request_id=3cbc7d0f-ed06-42a2-8332-e40600fab89e fwd="76.185.114.198" dyno=web.1 connect=0ms service=9ms status=500 bytes=1754 protocol=https
// 2021-09-21T20:11:06.697183+00:00 app[web.1]: Completed 500 Internal Server Error in 4ms (ActiveRecord: 3.1ms)
// 2021-09-21T20:11:06.697600+00:00 app[web.1]: 
// 2021-09-21T20:11:06.697600+00:00 app[web.1]: ActiveRecord::StatementInvalid (PG::UndefinedTable: ERROR:  relation "searches" does not exist
// 2021-09-21T20:11:06.697601+00:00 app[web.1]: LINE 5:                WHERE a.attrelid = '"searches"'::regclass
// 2021-09-21T20:11:06.697601+00:00 app[web.1]: ^
// 2021-09-21T20:11:06.697602+00:00 app[web.1]: :               SELECT a.attname, format_type(a.atttypid, a.atttypmod),
// 2021-09-21T20:11:06.697602+00:00 app[web.1]: pg_get_expr(d.adbin, d.adrelid), a.attnotnull, a.atttypid, a.atttypmod
// 2021-09-21T20:11:06.697602+00:00 app[web.1]: FROM pg_attribute a LEFT JOIN pg_attrdef d
// 2021-09-21T20:11:06.697603+00:00 app[web.1]: ON a.attrelid = d.adrelid AND a.attnum = d.adnum
// 2021-09-21T20:11:06.697603+00:00 app[web.1]: WHERE a.attrelid = '"searches"'::regclass
// 2021-09-21T20:11:06.697603+00:00 app[web.1]: AND a.attnum > 0 AND NOT a.attisdropped
// 2021-09-21T20:11:06.697603+00:00 app[web.1]: ORDER BY a.attnum
// 2021-09-21T20:11:06.697604+00:00 app[web.1]: ):
// 2021-09-21T20:11:06.697604+00:00 app[web.1]: app/controllers/searches_controller.rb:5:in `new'
// 2021-09-21T20:11:06.697604+00:00 app[web.1]: 
// 2021-09-21T20:11:06.697605+00:00 app[web.1]: 
// vagrant@vagrant-ubuntu-trusty-64:/vagrant/prana_proto_postgresql/prana$ heroku run rake db:migrate
// Running rake db:migrate on ⬢ afternoon-beyond-72366... up, run.5958 (Free)
// /app/vendor/bundle/ruby/2.6.0/gems/activesupport-4.2.9/lib/active_support/core_ext/object/duplicable.rb:111: warning: BigDecimal.new is deprecated; use BigDecimal() method instead.
// The PGconn, PGresult, and PGError constants are deprecated, and will be
// removed as of version 1.0.

// You should use PG::Connection, PG::Result, and PG::Error instead, respectively.

// Called from /app/vendor/bundle/ruby/2.6.0/gems/activesupport-4.2.9/lib/active_support/dependencies.rb:240:in `load_dependency'
//    (379.2ms)  CREATE TABLE "schema_migrations" ("version" character varying NOT NULL) 
//    (230.4ms)  CREATE UNIQUE INDEX  "unique_schema_migrations" ON "schema_migrations"  ("version")
//   ActiveRecord::SchemaMigration Load (2.7ms)  SELECT "schema_migrations".* FROM "schema_migrations"
// Migrating to CreateAsanas (20210908163501)
//    (1.1ms)  BEGIN
// == 20210908163501 CreateAsanas: migrating =====================================
// -- create_table(:asanas)
//    (425.6ms)  CREATE TABLE "asanas" ("id" serial primary key, "asana_name" character varying, "asana_type" character varying, "target_general" character varying, "target_specific" character varying, "difficulty" character varying, "duration" integer, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL) 
//    -> 0.4260s
// == 20210908163501 CreateAsanas: migrated (0.4261s) ============================

//   SQL (1.3ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1)  [["version", "20210908163501"]]
//    (2.5ms)  COMMIT
// Migrating to CreateSearches (20210921182505)
//    (1.0ms)  BEGIN
// == 20210921182505 CreateSearches: migrating ===================================
// -- create_table(:searches)
//    (391.9ms)  CREATE TABLE "searches" ("id" serial primary key, "keywords" character varying, "asana_name" character varying, "asana_type" character varying, "target_general" character varying, "target_specific" character varying, "difficulty" character varying, "duration" integer, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL) 
//    -> 0.3923s
// == 20210921182505 CreateSearches: migrated (0.3923s) ==========================

//   SQL (1.0ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1)  [["version", "20210921182505"]]
//    (2.2ms)  COMMIT
// vagrant@vagrant-ubuntu-trusty-64:/vagrant/prana_proto_postgresql/prana$ heroku ps:scale web=1
// Scaling dynos... done, now running web at 1:Free
// vagrant@vagrant-ubuntu-trusty-64:/vagrant/prana_proto_postgresql/prana$ heroku ps
// Free dyno hours quota remaining this month: 550h 0m (100%)
// Free dyno usage for this app: 0h 0m (0%)
// For more information on dyno sleeping and how to upgrade, see:
// https://devcenter.heroku.com/articles/dyno-sleeping

// === web (Free): bin/rails server -p ${PORT:-5000} -e $RAILS_ENV (1)
// web.1: up 2021/09/21 20:09:49 +0000 (~ 5m ago)

// vagrant@vagrant-ubuntu-trusty-64:/vagrant/prana_proto_postgresql/prana$ 