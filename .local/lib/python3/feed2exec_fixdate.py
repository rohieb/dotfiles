import time
def filter(*args, feed=None, item=None, **kwargs):
    """Set date of updated articles to now.

    Useful if a feed has stuck dates, or no dates at all.
    """

    if "updated_parsed" in item.keys():
        item["updated_parsed"] = time.localtime()
    else:
        item["published_parsed"] = time.localtime()

