��    x      �  �   �      (
     )
     6
     C
     T
  
   `
     k
     �
     �
     �
     �
  
   �
  !   �
      �
  B     G   N  C   �  �   �     �     �     �  6   �     $  /   )     Y     s     �  (   �  �   �  �   �  �   ?     �               7     G     Z     u     �     �     �     �  "   �  1   �       [   !  `   }  ]   �     <     C     V     [     u  `   �     �     �     �                    &     -     <  1   M  6        �  :   �  ?     ;   C          �     �     �     �     �  /   �  >        L     d  P   x     �     �     �          ,  �   H     �     �  ,   �  "      	   C  K   M  {   �  E     �   [     8     U  \   o  [   �     (  A   <  =   ~  {   �     8  �   G  [        r     x  �        4     A  
   _     j  	   y  	   �  4   �     �     �     �     �  �        �  $   �     �     �        3      )   R      |      �   ,   �      �      �   $   !  Z   1!  ^   �!  X   �!  �  D"     �#     $  '   -$  �   U$     �$  K   �$  >   ;%  =   z%  /   �%  M   �%  �  6&  �  (  �  	*  C   �+     ;,  C   W,  &   �,     �,  9   �,  0   -  6   L-     �-     �-  *   �-  c   �-  C   -.  $   q.  �   �.  �   g/  �   <0  	   �0  =   1  
   @1  +   K1  &   w1  �   �1     N2     Z2     i2  %   �2     �2     �2  
   �2     �2     �2  j   3  n   s3     �3  v   �3  z   t4  t   �4  "   d5  !   �5     �5     �5  .   �5  0   6  M   86  s   �6  G   �6  *   B7  �   m7  $   8  $   ;8  N   `8  9   �8  2   �8  .  9     K:  '   g:  Y   �:  k   �:  	   U;     _;  
  �;  �   �<  M  �=  6   �>  <   ?  �   E?  �   @  2   �@  �   A  �   �A  �   QB  &   4C  i  [C  �   �D     bE     oE  �  }E     8G  ?   RG     �G  9   �G  !   �G     
H  z   H     �H  -   �H     �H  ?   �H     #      H       R       $   P   _   b      Y   2   (       m   e   O          .   -   s      E      	           )   :      5   3   0       j   l              a   @   K   U       T   G   Q   ^   1       C       +       7   V              !   N   c      D           Z       >      '   6          F   I           9   [       p   &   %               =         ,      S       h      i   ]       \                  q   
       /   B       `   g           d                  4   J                v          n   t   A   "   L   x   M         o           r       W   ;   <   X   f       *   u   8       ?                  w   k    %s disc mask %s pres mask %s rigidity mask %s seam map <b>Map</b> <b>Operations control</b> <b>Seams control</b> Advanced Apply Applying changes... Auto size: Colour to use for the first seams Colour to use for the last seams Creates a new transparent layer ready to be used as a discard mask Creates a new transparent layer ready to be used as a preservation mask Creates a new transparent layer ready to be used as a rigidity mask Creates an extra output layer with the seams, for visual inspection of what the plugin did. Use it together with "Output on a new layer", and resize in one direction at a time.
Note that this option is ignored in interactive mode Discard Discard features Drawing seam map... Dump the internal map on a new layer (RGB images only) Edit Edit the currently selected rigidity mask layer Error: image type changed Error: invalid image Error: invalid layer Error: number of colour channels changed Extra layers are needed to activate feature discard.
You can create one with the "New" button and paint on it, then press the "Refresh" button.
Note that painting in black has no effect Extra layers are needed to activate feature preservation.
You can create one with the "New" button and paint on it, then press the "Refresh" button.
Note that painting in black has no effect Extra layers are needed to be used as rigidity masks.
You can create one with the "New" button and paint on it, then press the "Refresh" button.
Note that painting in black has no effect Feature discard mask Feature masks Feature preservation mask Feature recog.: First seams colour GIMP LiquidRescale Plug-In Grad. sum (bright.) Grad. sum (luma) Height Height: Horizontal first Ignore discard mask when enlarging Increasing this value results in straighter seams Last seams colour Layer to be used as a mask for feature discard.
Use the "Refresh" button to update the list Layer to be used as a mask for feature preservation.
Use the "Refresh" button to update the list Layer to be used as a mask for rigidity settings.
Use the "Refresh" button to update the list Layer: Li_quid rescale... Mask Max enlargement per step: Max transversal step: Maximum displacement along a seam. Increasing this value allows to overcome the 45 degrees bound Mode: New Next step at Not enough memory Null Orientation Output Output target: Output the seams Overall coefficient for feature discard intensity Overall coefficient for feature preservation intensity Overall rigidity: Paint the discard mask
on the current layer, then press OK Paint the preservation mask
on the current layer, then press OK Paint the rigidity mask
on the current layer, then press OK Parsing layer... Preserve features Range Reference size Rescale order: Reset the internal map Reset width and height to their original values Resize and translate the image canvas to fit the resized layer Resize auxiliary layers Resize image canvas Resize the layers used as features or rigidity masks along with the active layer Resizing height... Resizing width... Scale back to the original size Select behaviour for the mask Select new width and height Select this if you want to transform back the layer after LqR has been performed.
Note that this option is ignored in interactive mode Selected layer Set width and height Set width and height to the last used values Show/hide internal map information Strength: Switch to interactive mode. Note that the current settings will be applied. This affects the automatic feature recognition.
It's the filter which will be used to determine the relevance of each pixel This controls the order of operations if rescaling in both directions This will have the same effect as setting the strenght to 0 in the discard mask when the first rescale step is an image enlargment (which normally is the best choice).
Note that this option is ignored in interactive mode Transversal grad. (bright.)  Transversal grad. (luma)  Try to set the final height as needed to remove the masked areas.
Only use with simple masks Try to set the final width as needed to remove the masked areas.
Only use with simple masks Use a rigidity mask Use an extra layer to mark areas where seams should be straighter Use an extra layer to preserve selected areas from distortion Use an extra layer to treat selected areas as if they were meaningless (useful to remove parts of the image when shrinking) Vertical first Warning: the discard mask information will be ignored with the current settings.
(If you know what you're doing you can override this behaviour by unchecking the corrensponding option in the "Advanced" tab) When enlarging beyond the value set here the rescaling will be performed in multiple steps. Width Width: You can choose to rescale back to the original size with LqR or standard scaling, or to use standard scaling to reach the previous width or height while preserving the aspect ratio _Interactive height only (uniform scaling) horizontal liquid rescale new image new layer scaling which keeps layer features (or removes them) selected layer standard scaling vertical width only (uniform scaling) Project-Id-Version: GIMP LiquidRescale Plug-In 0.2.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2010-05-24 02:18+0200
PO-Revision-Date: 2010-02-26 07:35+0300
Last-Translator: Alexandre Prokoudine <alexandre.prokoudine@gmail.com>
Language-Team:  <gnome-cyr@lists.gnome.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Poedit-Language: Russian
 %s - маска удаления %s - маска сохранения %s - маска прямоты %s - карта швов <b>Карта</b> <b>Контроль над процедурой</b> <b>Контроль над швами</b> Дополнительно Применять Применяются изменения... Авторазмер: Цвет первых швов Цвет последних швов Создать новый прозрачный слой для маски удаления Создать новый прозрачный слой для маски сохранения Создать новый прозрачный слой для маски прямоты Создать новый слой и нарисовать в нем швы. Используйте этот параметр вместе с параметром «Поместить результат в новый слой» и меняйте размер изображения только в одном измерении за раз.
В интерактивном режиме эта функция не работает. Не использовать Удалить объекты Рисуется карта швов... Сбросить внутреннюю карту в новый слой (только для изображений в режиме RGB) Изменить Изменить выбранный слой с маской прямоты Ошибка: изменился тип изображения Ошибка: некорректное изображение Ошибка: некорректный слой Ошибка: изменилось число цветовых каналов Для удаления незначимых объектов необходимы
дополнительные слои. Вы можете создать такой слой,
нажав кнопку «Создать слой», нарисовав на созданном
слое маску выделения и нажав кнопку «Обновить».
Обратите внимание, что закрашивание черным цветом
ни на что не влияет. Для сохранения значимых  объектов необходимы
дополнительные слои. Вы можете создать такой слой,
нажав кнопку «Создать слой», нарисовав на созданном
слое маску выделения и нажав кнопку «Обновить».
Обратите внимание, что закрашивание черным цветом
ни на что не влияет. Для удаления создания масок прямоты необходимы дополнительные слои.
Вы можете создать такой слой, нажав кнопку «Создать слой», нарисовав
на созданном слое маску выделения и нажав кнопку «Обновить».
Обратите внимание, что закрашивание черным цветом ни на что не влияет. Маска удаляемых незначимых объектов Маски объектов Маска сохраняемых значимых объектов Распознавание краёв: Цвет первых швов Избирательное масштабирование Сумма градиентов (яркость) Сумма градиентов (светимость) Высота Высота: Сначала по горизонтали Игнорировать маски удаляемых объектов при увеличении Чем выше это значение, тем прямее швы Цвет последних швов Слой, используемый в качестве маски удаляемых объектов.
Нажимайте кнопку «Обновить» для обновления списка слоев. Слой, используемый в качестве маски сохраняемых объектов.
Нажимайте кнопку «Обновить» для обновления списка слоев. Слой, используемый в качестве маски прямоты.
Нажимайте кнопку «Обновить» для обновления списка слоев. Слой: _Избирательное масштабирование... Маска Макс. увеличение за шаг: Макс. поперечный шаг: Максимальное смещение вдоль шва. Повышение этого значения позволяет преодолевать границу в 45°. Режим: Создать Следующий шаг в Недостаточно памяти Ноль Ориентация Вывод Цель вывода: Нарисовать швы Коэффициент силы действия при удалении значимых объектов Коэффициент силы действия при сохранении значимых объектов Общая прямота: Нарисуйте маску удаления на
текущем слое, затем нажмите кнопку OK Нарисуйте маску сохранения на
текущем слое, затем нажмите кнопку OK Нарисуйте маску прямоты на
текущем слое, затем нажмите кнопку OK Разбирается слой... Сохранить объекты Диапазон Исходный размер Порядок масштабирования: Обнулить внутреннюю карту Вернуть исходное значение ширины и высоты Подогнать размер холста изображения под размер конечного слоя Изменить размер вспомогательных слоев Изменить размер холста Изменить размер слоев с сохраняемыми объектами или масками прямоты вместе с активным слоем Изменяется высота... Изменяется ширина... Масштабировать назад до исходного размера Укажите, как работать с масками Выбор новой ширины и высоты Используйте эту функцию, если хотите вернуть
слою исходный размер после выполнения
избирательного масштабирования.
В интерактивном режиме эта функция не работает. Выбранный слой Новая высота и ширина Использовать последнее значение ширины и высоты Показать или скрыть информацию о внутренней карте энергии Сила: Переключиться в интерактивный режим. Текущие параметры будут учтены. Здесь выбирается фильтр, определяющий
релевантность каждой точки растра, 
что в конечном счёте влияет на 
автоматическое распознавание объектов Этот переключатель контролирует порядок выполнения операций в обоих направлениях Эффект будет тем же, как если бы вы указали силу равной 0 для маски удаления незначимых файлов, когда первым шагом является увеличение.
В интерактивном режиме эта функция не работает. Поперечный градиент (яркость) Поперечный градиент (светимость) Попробуйте указать конечную высоту, чтобы удалить замаскированные области.
Используйте только с простыми масками Попробуйте указать конечную ширину, чтобы удалить замаскированные области.
Используйте только с простыми масками Использовать маску прямоты Использовать дополнительный слой для пометки областей, где швы должны быть прямее Используйте дополнительный слой для предохранения избранных областей от искажения Используйте дополнительный слой для удаления избранных областей, не имеющих значения (полезно при уменьшении изображения) Сначала по вертикали Предупреждение: с текущими параметрами маска удаления незначимых объектов
будет проигнорирована. Если вы точно знаете, что делаете, отключите соответствующий параметр на вкладке «Дополнительно» При увеличении на значение (%) больше заданного здесь выполнять его в несколько шагов. Ширина Ширина: Вы можете выбрать между обратным масштабирование к исходному размеру при помощи либо LqR, либо простого масштабирования, и использованием обычного масштабирования для получения предыдущей высоты или ширины с сохранением соотношения сторон _Интерактивно Только по высоте (неизбирательное) по горизонтали Избирательное масштабирование Новое изображение Новый слой Масштабирование с сохранением или удалением объектов изображения Выбранный слой Обычное масштабирование по вертикали Только по ширине (неизбирательное) 