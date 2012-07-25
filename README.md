# Shoehorn: a Twitter Bootstrap 2.0 helper library for Rails

This gem focuses on making it easier to use Twitter's Bootstrap 2.0.
It's a collection of helpers which should make it faster to use all the components provided by Twitter Bootstrap.

The gem started as a fork of pusewicz's twitter-bootstrap-markup-rails gem (https://github.com/pusewicz/twitter-bootstrap-markup-rails),
but I need more customization. So I borrowed the gem structure and some code for developing Shoehorn.


## Installation

Add to your `Gemfile`:

```ruby
gem 'shoehorn'
```

## Currently Supported

* Alert messages
* Inline labels
* Buttons
* Button dropdowns
* link_to
* Badges
* Modal windows
* Navigation (tabs, pills)
* Progress bars


Examples
---

### Rendering Alert

```ruby
bootstrap_alert("Hello!")
# => '<div class="alert"><a class="close">×</a>Hello!</div>'
```

Rendering Info Block Alert

```ruby
bootstrap_alert("Hello!", type: 'info', block: true)
# => '<div class="alert alert-block alert-info"><a class="close">×</a>Hello!</div>'
```

Add Alert heading:

```ruby
bootstrap_alert("Content of alert", heading: "WARNING!", type: 'info')
# => '<div class="alert alert-info"><a class="close">×</a><h4 class="alert-heading">WARNING!</h4>Content of alert</div>'
```

Remove closing button

```ruby
bootstrap_alert("Hello!", type: 'error', close: false)
# => '<div class="alert alert-error">Hello!</div>'
```


### Notice Inline Label

Normal label

```ruby
bootstrap_label("Hello!")
# => '<span class="label">Hello!</span>'
```

Change type (available values are: info, success, warning, important or inverse)

```ruby
bootstrap_label("Hello!", type: 'warning')
# => '<span class="label label-warning">Hello!</span>'
```

Add custom CSS class

```ruby
bootstrap_label("Hello!", type: 'important', class: "my_awesome_class")
# => '<span class="my_awesome_class label label-important">Hello!</span>'
```

Customize Bootstrap CSS class prefix (really needed???)

```ruby
bootstrap_label("Hello!", type: 'info', bootstrap_class_prefix: "my_label")
# => '<span class="my_label my_label-info">Hello!</span>'
```

### Notice Badge

Normal badge

```ruby
bootstrap_badge("Hello!")
# => '<span class="badge">Hello!</span>'
```

Change type (available values are: info, success, warning, important or inverse)

```ruby
bootstrap_badge("Hello!", type: 'success')
# => '<span class="badge badge-success">Hello!</span>'
```

Add custom CSS class

```ruby
bootstrap_badge("Hello!", type: 'warning', class: "my_awesome_class")
# => '<span class="my_awesome_class badge badge-warning">Hello!</span>'
```

Customize Bootstrap CSS class prefix (really needed???)

```ruby
bootstrap_label("Hello!", type: 'info', bootstrap_class_prefix: "my_label")
# => '<span class="my_label my_label-info">Hello!</span>'


### Icon inline

```ruby
bootstrap_icon(name: 'user', icon_white: true)
#   # => '<i class="icon-user icon-white"></i>'
```

```ruby
bootstrap_icon(text: "Current time", name: 'time')
# => '<i class="icon-time"></i> Current time'
```

```ruby
bootstrap_icon(class: "my_awesome_class", name: 'glass')
# => '<i class="icon-glass my_awesome_class"></i>'
```

### Buttons

```ruby
bootstrap_button("Button Text", "#")
# => '<a class="btn" href="#">Button Text</a>'
```

### Link_to, link_to_if, link_to_unless

They are a shortcut to bootstrap_button with bootstrap_class_prefix => nil .
In this way they are rendered as normal bootstrap_button, without being styled.

```ruby
bootstrap_link_to 'Search', "#", type: 'primary', icon_name: 'search'
# => '<a href="#"><i class="icon-search"></i> Search</a>'
```

```ruby
bootstrap_link_to_if condition, 'Search', "#", type: 'primary', icon_name: 'search' { nil }
# => '<a href="#"><i class="icon-search"></i> Search</a>'
```

```ruby
bootstrap_link_to_unless !condition, 'Search', "#", type: 'primary', icon_name: 'search' { nil }
# => '<a href="#"><i class="icon-search"></i> Search</a>'
```

### Dropdown Buttons

```ruby
bootstrap_button_dropdown do |b|
    b.bootstrap_button "Button Title", "#"
    b.bootstrap_link_to "First Dropdown Item", item_path(@item)
    b.link_to "Second Dropdown Item", @item2
end
#  => '<div class="btn-group">
#        <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
#          Button Title
#          <span class="caret"></span>
#        </a>
#        <ul class="dropdown-menu">
#          <!-- dropdown menu links -->
#        </ul>
#      </div>'
```

### Navigation lists

### Basic tabs example

```ruby
bootstrap_navigation do |nav|
  nav.link_to "Nav1", "/link1", :active_nav => true
  nav.link_to "Nav2", "/link2"
end
# => '<ul class="nav nav-tabs">
#       <li class="active">
#         <a href="/link1">Nav1</a>
#       </li>
#       <li>
#         <a href="/link2">Nav2</a>
#       </li>
#     </ul>'
```

### Basic pills example

```ruby
bootstrap_navigation(:type => "pills") do |nav|
  nav.link_to "Nav1", "/link1"
  nav.link_to "Nav2", "/link2", :active_nav => true
end
# => '<ul class="nav nav-pills">
#       <li>
#         <a href="/link1">Nav1</a>
#       </li>
#       <li class="active">
#         <a href="/link2">Nav2</a>
#       </li>
#     </ul>'
```

### Stacked tabs example

```ruby
bootstrap_navigation(:type => "tabs", :stacked => true) do |nav|
  nav.link_to "Nav1", "/link1", :active_nav => true
  nav.link_to "Nav2", "/link2"
end
# => '<ul class="nav nav-tabs nav-stacked">
#       <li class="active">
#         <a href="/link1">Nav1</a>
#       </li>
#       <li>
#         <a href="/link2">Nav2</a>
#       </li>
#     </ul>'
```

### Stacked pills example

```ruby
bootstrap_navigation(:type => "pills", :stacked => true) do |nav|
  nav.link_to "Nav1", "/link1"
  nav.link_to "Nav2", "/link2", :active_nav => true
end
# => '<ul class="nav nav-pills nav-stacked">
#       <li>
#         <a href="/link1">Nav1</a>
#       </li>
#       <li class="active">
#         <a href="/link2">Nav2</a>
#       </li>
#     </ul>'
```

### Modal popup example

```ruby
bootstrap_modal(id: "a_dom_id", fade: true, title: "Modal title!") do |modal|
  modal.body do |c|
    c.render partial: 'body'
  end
  modal.footer do |c|
    c.bootstrap_button "Close", "#", type: 'danger', html_options: { data: { dismiss: "modal" } }
    c.bootstrap_button "Accept",  accept_request_path(@request),
                       icon_name: 'ok', type: 'success',
                       html_options: { data: { dismiss: "modal" }, method: :put }
  end
end
# => '<div class="modal fade" id="a_dom_id">
#       <div class="modal-header">
#         <a class="close" data-dismiss="modal">&times</a>
#         <h3>Modal title!</h3>
#       </div>
#       <div class="modal-body">
#         <div>partial content</div>
#       </div>
#       <div class="modal-footer">
#         <a href="#" data-dismiss="modal" class=" btn btn-danger">Close</a>
#         <a method="put" href="/request/1/accept" data-dismiss="modal" class=" btn btn-success"><i class=" icon icon-ok icon-white"></i> Accept</a>
#       </div>
#     </div>'
```

Plugins
---

### For [SimpleNavigation](https://github.com/andi/simple-navigation)

If you are using `simple-navigation` gem you can use the navigation renderer like this:

In your initializer:

```ruby
SimpleNavigation.register_renderer :bootstrap_topbar_list => SimpleNavigation::Renderer::BootstrapTopbarList
```

```ruby
render_navigation(level: 1..2, renderer: :bootstrap_topbar_list, expand_all: true)
```

Contributing
---

In the spirit of free software, everyone is encouraged to help improve this project.

Here are some ways you can contribute:

* by using alpha, beta, and prerelease versions
* by reporting bugs
* by suggesting new features
* by writing or editing documentation
* by writing specifications
* by writing code (no patch is too small: fix typos, add comments, clean up inconsistent whitespace)
* by writing tests
* by refactoring code
* by closing [issues](https://github.com/mcanato/shoehorn/issues)
* by reviewing patches

Submitting an Issue
---

We use the [GitHub issue tracker](https://github.com/mcanato/shoehorn/issues) to track bugs and features. Before submitting a bug report or feature request, check to make sure it hasn't already been submitted. You can indicate support for an existing issue by voting it up. When submitting a bug report, please include a [gist](https://gist.github.com/) that includes a stack trace and any details that may be necessary to reproduce the bug, including your gem version, Ruby version, and operating system. Ideally, a bug report should include a pull request with failing specs.

Submitting a Pull Request
---

1. Fork the project.
2. Create a topic branch.
3. Implement your feature or bug fix.
4. Add documentation for your feature or bug fix.
5. Run `bundle exec rake yard`. If your changes are not 100% documented, go back to step 4.
6. Add specs for your feature or bug fix.
7. Run `bundle exec rake spec`. If your changes are not 100% covered, go back to step 6.
8. Commit and push your changes.
9. Submit a pull request. Please do not include changes to the gemspec, version, or history file. (If you want to create your own version for some reason, please do so in a separate commit.)