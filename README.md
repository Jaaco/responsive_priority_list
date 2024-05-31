# Responsive Priority List
The purpose of this widget is to have responsive Rows & Columns, that hide their children depending on size and prioritry.

## Usage
Use either the `.column` or `.row` constructor.
Wrap your widgets in a `PriorityWidget`, where the `sizeInMainAxis` is the size in pixels along the main axis of the chosen widget.

The `ResponsivePriorityList` will try to fit all children, but if constraints along the main axis are too small, it will omit widgets based on the following rules.

## Rules
The algorithm that decides which children are rendered has few rules.

Priority is measured from lowest to highest integers (0 has higher priority than 1).

If two widgets have the same priority, the one earlier in the list takes precedence.
If a widget has priority but is too large for the available size, the next widget in the priority list is chosen.

By definition, if all widgets are too large for the available size, no widgets will be rendered.

