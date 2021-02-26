# canvas-flutter

Canvas in flutter

Canvas
* An interface for recording graphical operations.
* Canvas objects are used in creating Picture objects, which can themselves be used with a SceneBuilder to build a Scene. In normal usage, however, this is all handled by the framework.
* A canvas has a current transformation matrix which is applied to all operations. Initially, the transformation matrix is the identity transform. It can be modified using the translate, scale, rotate, skew, and transform methods.
* A canvas also has a current clip region which is applied to all operations. Initially, the clip region is infinite. It can be modified using the clipRect, clipRRect, and clipPath methods.
* The current transform and clip can be saved and restored using the stack managed by the save, saveLayer, and restore methods.


CustomPainter class
* The interface used by CustomPaint (in the widgets library) and RenderCustomPaint (in the rendering library).
* To implement a custom painter, either subclass or implement this interface to define your custom paint delegate. CustomPaint subclasses must implement the paint and shouldRepaint methods, and may optionally also implement the hitTest and shouldRebuildSemantics methods, and the semanticsBuilder getter.
* The paint method is called whenever the custom object needs to be repainted.
* The shouldRepaint method is called when a new instance of the class is provided, to check if the new instance actually represents different information.



paint(Canvas canvas,Size size) 
* Called whenever the object needs to paint. The given Canvas has its coordinate space configured such that the origin is at the top left of the box. The area of the box is the size of the size argument.

shouldRepaint() 
* Called whenever a new instance of the custom painter delegate class is provided to the RenderCustomPaint object, or any time that a new CustomPaint object is created with a new instance of the custom painter delegate class (which amounts to the same thing, because the latter is implemented in terms of the former).
* If the new instance represents different information than the old instance, then the method should return true, otherwise it should return false.
* If the method returns false, then the paint call might be optimized away.
* It's possible that the paint method will get called even if shouldRepaint returns false (e.g. if an ancestor or descendant needed to be repainted). It's also possible that the paint method will get called without shouldRepaint being called at all (e.g. if the box changes size).
* If a custom delegate has a particularly expensive paint function such that repaints should be avoided as much as possible, a RepaintBoundary or RenderRepaintBoundary (or other render object with RenderObject.isRepaintBoundary set to true) might be helpful.
* The oldDelegate argument will never be null.




Paint
* A description of the style to use when drawing on a Canvas.
* Most APIs on Canvas take a Paint object to describe the style to use for that operation.

Path
* A complex, one-dimensional subset of a plane.
* A path consists of a number of sub-paths, and a current point.
* Sub-paths consist of segments of various types, such as lines, arcs, or beziers. Sub-paths can be open or closed, and can self-intersect.
* Closed sub-paths enclose a (possibly discontiguous) region of the plane based on the current fillType.
* The current point is initially at the origin. After each operation adding a segment to a sub-path, the current point is updated to the end of that segment.
* Paths can be drawn on canvases using Canvas.drawPath, and can used to create clip regions using Canvas.clipPath.

save() : This method is used to save the current state of Canvas.
restore() : This method is used to restore the saved state from stack.
            We can use any number of save before restore and the stack will remember all entries,
            i.e. restore will always pop the most recent entry.
            

References
Canvas Advance Use Cases
https://medium.com/flutter-community/flutter-face-detection-ac18e3e2211f

Animating the shapes on Canvas
https://blog.codemagic.io/_____________________________________________________________________________________________________________________

# Animating the Shapes Drawn using Canvas


