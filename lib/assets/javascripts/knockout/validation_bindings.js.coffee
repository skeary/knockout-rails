ko.bindingHandlers.validationErrorClass = {
  update: (element, valueAccessor, allBindingsAccessor, data) ->
    value = valueAccessor()
    if value?
      if value.errors()? && value.isModified()
        $(element).addClass(data)
      else
        $(element).removeClass(data)
    return
}

ko.bindingHandlers.cssValidationError = {
  update: (element, valueAccessor, allBindingsAccessor, data) -> 
    value = ko.utils.unwrapObservable(valueAccessor())
    if (typeof value == "object")
      for className, observable of value 
        shouldHaveClass = observable.errors()? && observable.isModified()
        ko.utils.toggleDomNodeCssClass(element, className, shouldHaveClass)
    return
}
