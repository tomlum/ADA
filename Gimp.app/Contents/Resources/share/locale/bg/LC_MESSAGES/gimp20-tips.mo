��             +         �  9   �  �     �   �  X   �  �     �   �  �  �  �   c  N   	  �   c	  �   <
  �   �
    �  �   �  �   [  �   �    �  �   �  /  �    �  �   �  �   X  �   �  �   t  �   5  �      j   �  �   �  �   �  |   b  �   �  m  �  t   K  a  �  �  "  �   �  �   �  �  �   F  ]"  �  �%  �   9'  �  �'  -  �)  ]  �*  �  &,  �  .    �/  �  �0  i  b2  �  �4  8  \6  �  �8    q:  <  �;    �<  \  �=  �  :?  �   �@  �   �A  �  �B  C  eD  �   �E  �  �F               
                                                                                                   	                              <big>Welcome to the GNU Image Manipulation Program!</big> <tt>Ctrl</tt>-click with the Bucket Fill tool to have it use the background color instead of the foreground color. Similarly, <tt>Ctrl</tt>-clicking with the eyedropper tool sets the background color instead of the foreground color. <tt>Ctrl</tt>-clicking on the layer mask's preview in the Layers dialog toggles the effect of the layer mask. <tt>Alt</tt>-clicking on the layer mask's preview in the Layers dialog toggles viewing the mask directly. <tt>Ctrl</tt>-drag with the Rotate tool will constrain the rotation to 15 degree angles. <tt>Shift</tt>-click on the eye icon in the Layers dialog to hide all layers but that one. <tt>Shift</tt>-click again to show all layers. A floating selection must be anchored to a new layer or to the last active layer before doing other operations on the image. Click on the &quot;New Layer&quot; or the &quot;Anchor Layer&quot; button in the Layers dialog, or use the menus to do the same. After you enabled &quot;Dynamic Keyboard Shortcuts&quot; in the Preferences dialog, you can reassign shortcut keys. Do so by bringing up the menu, selecting a menu item, and pressing the desired key combination. If &quot;Save Keyboard Shortcuts&quot; is enabled, the key bindings are saved when you exit GIMP. You should probably disable &quot;Dynamic Keyboard Shortcuts&quot; afterwards, to prevent accidentally assigning/reassigning shortcuts. Click and drag on a ruler to place a guide on an image. All dragged selections will snap to the guides. You can remove guides by dragging them off the image with the Move tool. GIMP allows you to undo most changes to the image, so feel free to experiment. GIMP supports gzip compression on the fly. Just add <tt>.gz</tt> (or <tt>.bz2</tt>, if you have bzip2 installed) to the filename and your image will be saved compressed. Of course loading compressed images works too. GIMP uses layers to let you organize your image. Think of them as a stack of slides or filters, such that looking through them you see a composite of their contents. If a layer's name in the Layers dialog is displayed in <b>bold</b>, this layer doesn't have an alpha-channel. You can add an alpha-channel using Layer→Transparency→Add Alpha Channel. If some of your scanned photos do not look colorful enough, you can easily improve their tonal range with the &quot;Auto&quot; button in the Levels tool (Colors→Levels). If there are any color casts, you can correct them with the Curves tool (Colors→Curves). If you stroke a path (Edit→Stroke Path), the paint tools can be used with their current settings. You can use the Paintbrush in gradient mode or even the Eraser or the Smudge tool. If your screen is too cluttered, you can press <tt>Tab</tt> in an image window to toggle the visibility of the toolbox and other dialogs. Most plug-ins work on the current layer of the current image. In some cases, you will have to merge all layers (Image→Flatten Image) if you want the plug-in to work on the whole image. Not all effects can be applied to all kinds of images. This is indicated by a grayed-out menu-entry. You may need to change the image mode to RGB (Image→Mode→RGB), add an alpha-channel (Layer→Transparency→Add Alpha Channel) or flatten it (Image→Flatten Image). Pressing and holding the <tt>Shift</tt> key before making a selection allows you to add to the current selection instead of replacing it. Using <tt>Ctrl</tt> before making a selection subtracts from the current one. To create a circle-shaped selection, hold <tt>Shift</tt> while doing an ellipse select. To place a circle precisely, drag horizontal and vertical guides tangent to the circle you want to select, place your cursor at the intersection of the guides, and the resulting selection will just touch the guides. When you save an image to work on it again later, try using XCF, GIMP's native file format (use the file extension <tt>.xcf</tt>). This preserves the layers and every aspect of your work-in-progress. Once a project is completed, you can save it as JPEG, PNG, GIF, ... You can adjust or move a selection by using <tt>Alt</tt>-drag. If this makes the window move, your window manager uses the <tt>Alt</tt> key already. You can create and edit complex selections using the Path tool. The Paths dialog allows you to work on multiple paths and to convert them to selections. You can drag a layer from the Layers dialog and drop it onto the toolbox. This will create a new image containing only that layer. You can drag and drop many things in GIMP. For example, dragging a color from the toolbox or from a color palette and dropping it into an image will fill the current selection with that color. You can draw simple squares or circles using Edit→Stroke Selection. It strokes the edge of your current selection. More complex shapes can be drawn using the Path tool or with Filters→Render→Gfig. You can get context-sensitive help for most of GIMP's features by pressing the F1 key at any time. This also works inside the menus. You can perform many layer operations by right-clicking on the text label of a layer in the Layers dialog. You can save a selection to a channel (Select→Save to Channel) and then modify this channel with any paint tools. Using the buttons in the Channels dialog, you can toggle the visibility of this new channel or convert it to a selection. You can use <tt>Ctrl</tt>-<tt>Tab</tt> to cycle through all layers in an image (if your window manager doesn't trap those keys...). You can use the middle mouse button to pan around the image (or optionally hold <tt>Spacebar</tt> while you move the mouse). You can use the paint tools to change the selection. Click on the &quot;Quick Mask&quot; button at the bottom left of an image window. Change your selection by painting in the image and click on the button again to convert it back to a normal selection. Project-Id-Version: gimp-tips trunk
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2007-07-27 15:50+0300
PO-Revision-Date: 2007-07-27 15:52+0300
Last-Translator: Victor Dachev <vdachev@gmail.com>
Language-Team: Bulgarian <dict@fsa-bg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
 <big>Добре дошли в програмата за обработка на изображения - GIMP!</big> <tt>Ctrl</tt>-натискане върху инструмента за запълване ще активира цвета на фона, вместо цвета за рисуване. По подобен начин ·<tt>Ctrl</tt>-натискане с пипетата задава цвета за фон, вместо този за рисуване. <tt>Ctrl</tt>-натискане върху предварителния прегледа на маската на слоя в менюто със слоевете превключва ефекта на маската. <tt>Alt</tt>-натискане върху предварителния преглед на маската в менюто със слоеве превключва видимостта на маската директно. <tt>Ctrl</tt>-влачене си инструмента за завъртане ще ограничи въртенето на стъпки с ъгъл по 15 градуса. <tt>Shift</tt>-натискане върху иконката с око в прозореца със слоевете ще скрие всички слоеве освен този. <tt>Shift</tt>-отново ще ги визуализира пак. Плаващата селекция трябва да бъде прикрепена към нов слой или последният активен такъв преди да се прави друго с изображението. Може да се използва натискане върху бутоните „Нов слой“ или „Фиксиране на плаващ слой“; в прозореца със слоевете или менютата. Ако се включи &quot;Използване на динамични бързи клавиши&quot; в настройките, могат да се задават нови бързи клавиши. Това се прави като се активира менюто, избира се действие и се натиска желаната клавишна комбинация. Ако &quot;Запазване на бързите клавиши при излизане&quot; е включено, те ще бъдат запазвани при излизане от GIMP. Вероятно бихте изключили &quot;Динамични клавишни комбинации&quot; след това за да предотвратите случайно задаване/презадаване на комбинации. Щракване върху водач и влачене ще създаде водач върху изображението. Всички влачени селекции ще се прилепват към водачите. Можете да премахвате водачите, като ги влачите извън изображението с инструмента за преместване. GIMP позволява да се отменят повечето промени по изображението, така че можете спокойно да експериментирате. GIMP поддържа gzip компресия в движение. Просто добавете <tt>.gz</tt> (или <tt>.bz2</tt>, ако имате инсталиран bzip2) към името на файла и изображението ще се запази в компресиран вид. Разбира се, работи и отварянето на компресирани изображения. GIMP  за по-лесна организация на изображението. Представете си ги като пакет плаки или диапозитиви, когато погледнете през пакета можете да видите цялото изображение. Ако името на слоя в прозореца със слоеве е показано <b>удебелено</b>, значи този слой няма канал за прозрачност. Можете да добавите такъв със Слой→Прозрачност→Добавяне на канал за прозрачност. Ако някои от сканираните изображения не изглеждат достатъчно цветни, можете лесно подобрите тоналността им с бутона &quot;Автоматично&quot; на инструмента за нива (Цветове→Нива). Ако все още не ви харесва, можете да го коригирате със инструмента за криви (Цветове→Криви). Ако очертаете пътека (Редактиране→Очертаване на пътеката), инструментите за рисуване ще се използват с текущите си настройки. Можете да използвате рисуването в режим на преливка или дори инструментите за триене и замазване. Ако екранът ви е претупан, можете да натиснете <tt>Tab</tt> в прозореца на изображението за да превключите видимостта на кутията с инструменти и другите диалози. Повечето приставки работят върху активния слой от активното изображение. В някой случаи се налага да слеете всички слоеве (Изображение→Изравняване на изображението) ако искате филтъра да работи върху цялото изображение. Не всички филтри работят върху всички типове изображения. Това се маркира със сиво в менюто. Може да се наложи да промените цветовия модел на изображението в ЧЗС (Изображение→Тип→ЧЗС), да добавите канал за прозрачност (Слой→Прозрачност→Добавяне на канал за прозрачност) или да го изравните (Изображение→Изравняване на изображението). Натискането и задържането на клавиш <tt>Shift</tt> преди селектиране ви позволява да добавите нова селекция, вместо да подмените старата. Използването на <tt>Ctrl</tt> преди селектиране изважда селектираното от старата селекция. За създаване на кръгова селекция, задръжте <tt>Shift</tt> по време на елипсовидно избиране. За да позиционирате кръг прецизно, можете да влачите хоризонталните и вертикални водачи до кръга, който искате да изберете, поставите показалеца в пресечната точка на водачите и получената селекция ще се напасне по водачите. Когато запазвате изображение, над което ще работите отново по-късно, можете да изберете XCF - формата на GIMP (използвайки разширение <tt>.xcf</tt>). Това запазва слоевете и всичко от вашата работа. След като веднъж проекта е завършен, можете да го запазите като JPEG, PNG, GIF... Можете да прецизирате или преместите селекция със <tt>Alt</tt> и влачене. Ако така се мести целият прозорец, мениджъра на прозорци вече използва клавиша<tt>Alt</tt>. Можете да създавате и променяте комплексни селекции с инструмента за пътеки. Дилалогът на пътеките ви позволява да работите по няколко пътеки и да ги превърнете в селекции. Мажете да влачите слой от прозореца със слоеве и да го пуснете върху кутията с инструменти. Това ще създаде ново изображение, съдържащо само този слой. Можете да влачите и пускате много неща в GIMP. Например влаченето на цвят от кутията с инструменти или палитрата с цветовете и пускането му върху изображение, ще запълни селекцията с този цвят. Можете да рисуване прости квадрати или кръгове с Редактиране→Очертаване на селекцията. Това очертава границите на текущата селекция. По-сложни форми могат за бъдат рисувани с инструмента за Пътеки или Филтри→Генериране→Gfig. Можете да получите контекстночувствителна помощ за повечето възможности на GIMP като натиснете F1 по всяко време. Работи и в менюта. Можете да направите много неща със слоеве като натиснете текстовия етикет на слоя в прозореца със слоевете. Можете да запазвате селекция като канал (Избиране→Запазване като канал) и да редактирате канала със инструментите за рисуване.Чрез използване на бутоните в прозореца за канали, можете да промените видимостта на новия канал или да го превърнете в селекция. Можете да използвате <tt>Ctrl</tt>-<tt>Tab</tt>> за да преминавате в различните слоеве на изображението (ако мениджъра на прозорци не е конфигуриран да използва тази комбинация за друго...). Можете да използвате средния бутон на мишката за да се движите по изображението (или да задържите <tt>Интервал<tt>, докато движите мишката) . Можете да използвате инструментите за рисуване за да промените селекцията. Натиснете бутона „Превключване на бързата маска“ в долният ляв ъгъл под изображението. Променяте селекцията с рисуване и натискате бутона отново за да се върнете в режим на селекция. 