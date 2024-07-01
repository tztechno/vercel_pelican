
content_error.md

---
```
pelican content
Traceback (most recent call last):
  File "/Users/shun_ishii/miniconda3/bin/pelican", line 5, in <module>
    from pelican.__main__ import main
  File "/Users/shun_ishii/miniconda3/lib/python3.7/site-packages/pelican/__init__.py", line 21, in <module>
    from pelican.generators import (ArticlesGenerator,  # noqa: I100
  File "/Users/shun_ishii/miniconda3/lib/python3.7/site-packages/pelican/generators.py", line 11, in <module>
    from jinja2 import (BaseLoader, ChoiceLoader, Environment, FileSystemLoader,
  File "/Users/shun_ishii/miniconda3/lib/python3.7/site-packages/jinja2/__init__.py", line 9, in <module>
    from .environment import Environment as Environment
  File "/Users/shun_ishii/miniconda3/lib/python3.7/site-packages/jinja2/environment.py", line 15, in <module>
    from markupsafe import Markup
ModuleNotFoundError: No module named 'markupsafe'
```
---
