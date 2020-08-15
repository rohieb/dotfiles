def filter(*args, feed=None, item=None, **kwargs):
    """Add the item link as first line to the summary, and only use the published date"""

    try:
        del item["updated"]
        del item["updated_parsed"]
    except KeyError:
        pass

    item["summary"] = item["link"] + '\n\n' + item.get("summary", "")
