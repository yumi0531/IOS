//
//  ContentView.swift
//  HW3
//
//  Created by yumi on 2022/11/9.
//

import SwiftUI


struct ContentView: View {
    @State private var day_count: GLint = 0
    @State private var love_count: GLint = 0
    @State private var showAlert = false
    @State private var red:Double = 1.0
    @State private var green:Double = 0.0
    @State private var blue:Double = 0.0
    @State private var bgColor = Color(red:222/255,green: 201/255,blue: 206/255)
    @State private var isPlay = false
    @State private var img = ""
    @Binding var EeveIndex:Int
    @State var showIntroduce = false
    @State var Introduce = false
    @State var introduceText :String = ""
    @State var attribute :String = ""
    @State var week :String = ""
    @State var Classification:String = ""
    @State var showMap = false
    let Eeve = ["火伊布","水伊布","雷伊布","葉伊布","冰伊布","太陽伊布","月亮伊布","仙子伊布"]
    let intro = ["蓬鬆的體毛有著像空氣中散熱、讓過度上升的體溫下降的功能。\n當火焰在體內積蓄時，火伊布的體溫也會隨之上升到最高９００度。會將吸入的空氣的一部分傳送到自己體內的火囊裡，製造出１７００度的火焰。","因突變而長出了鰭和鰓，變得能夠在水中生活，有著可以自在地操空水的力量。當水伊布開始微微顫動牠全身上下的鰭，就表示幾個小時之後要下雨了。身體細胞的結構與水分子相似。牠能和水融為一體，讓別人無法看見牠。從牠身上可檢出酷似水分子的細胞。吾人推測這就是牠潛水時得以隱身的原因，而這也是人魚傳說的真相。","會利用體毛上的靜電增強細胞發出的微弱電流來製造落雷，豎起來的體毛就像是一根根帶電的針。當雷伊布生氣或是吃驚時，牠全身的體毛會像針一樣豎起來刺穿對手。有時會吸入空氣中的負離子，吐出大約１００００伏特的高壓電。","靠光合作用補充營養，在有著清澈河流的森林深處靜靜地生活著。伽勒爾人對牠的葉片散發出的獨特香氣情有獨鍾。用這種香氣加工出的香水非常受歡迎。從體毛中可檢出近似植物的細胞。堅硬的尾部能將大樹一刀兩斷，鋒利程度更勝名刀一籌。","可以在一瞬間將周圍的水分凍結起來形成冰粒，然後朝獵物發射出去。能夠降下冰晶。被牠的美貌迷住的獵物會在不知不覺間被凍住。擁有急速降低體熱的能力，能凍結大氣，引發細碎冰晶如同寶石般閃耀飛舞的現象。冰伊布釋放出的冷氣能製造出粉狀的雪。這使牠受到各個滑雪場的熱烈歡迎。","對自己認可的訓練家極為忠誠，據說為了保護訓練家的安全，預知能力變得非常發達。能透過感受空氣的流動，準確地預測出接下來的天氣和對手的行動等等。從額頭的珠子放射出精神力量進行戰鬥。當力量用盡時，珠子的顏色也會褪去。能夠發揮不可思議的力量，預測天候及人心。當沐浴在日光下時，額上紅珠會發亮，令牠活力大增。","受到月亮波動影響而進化的寶可夢，會一直潛伏黑暗中觀察對手，發動襲擊時身上的圈圈會發光。在發怒的時候會從全身的毛孔裡噴出混合了毒素的汗液，瞄準對手的眼睛發動攻擊。在滿月之夜或是興奮的時候，牠身上圈圈一樣的花紋就會發出金黃色的光。活躍於月光灑落大地的夜半時分。大大的眼睛即使是在黑暗之中也能牢牢捕捉獵物的身影。","伽勒爾地區的童話中有著美麗的仙子伊布擊退了可怕的龍寶可夢的故事。會從緞帶般的觸角裡釋放能夠消除敵意的波動，藉此平息紛爭。"]
    
    let attributeArr = ["火","水","電","草","冰","超能力","惡","妖精"]
    
    let weekArr = ["水、地面、岩石","草、電","地面","火、冰、毒、飛行、蟲","火、格鬥、岩石、鋼","蟲、幽靈、惡","格鬥、蟲、妖精","毒、鋼"]
    
    let classArr = ["火寶可夢","吐泡寶可夢","雷寶可夢","新綠寶可夢","新雪寶可夢","太陽寶可夢","月光寶可夢","連結寶可夢"]
    var body: some View {
//        EevIndex = EeveIndex
        ZStack {
            Image("background_img")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
                .ignoresSafeArea()
            
            Text("飼養伊布")
                .font(.custom("jf-openhuninn-1.1", size: 35))
                .offset(y:-300)
            Button{
                love_count+=1
                if(love_count >= 10){
                    showAlert = true
                }
            }label: {
                if(love_count >= 10){
                    Image(img)
                        .resizable()
                        .background(bgColor)
                        .scaledToFill()
                        .frame(width: 200,height: 200)
                        .offset(y:-150)
                }else{
                    Image(img)
                        .resizable()
                        .background(bgColor)
                        .scaledToFill()
                        .frame(width: 200,height: 200)
                        .offset(y:-150)
                }
            }.alert("伊布已經很開心了喔", isPresented: $showAlert, actions: {
                Button("OK") { }
            })
            HStack{
                ColorPicker("毛色", selection: $bgColor)
                Toggle("原毛色", isOn: $isPlay)
                    .onChange(of: isPlay, perform: { value in
                        if value { //true
                            if(love_count >= 10){
                                img = Eeve[EeveIndex]
                            }else{
                                img = "伊布"
                            }
                            bgColor = Color(red:222/255,green: 201/255,blue: 206/255)
                        } else {
                            if(love_count >= 10){
                                img = Eeve[EeveIndex] + "空"
                            }else{
                                img = "伊布空"
                            }
                        }
                    })
            }
            VStack(spacing: 20){
                Button{
                    Introduce = true
                    introduceText = intro[EeveIndex]
                    attribute = attributeArr[EeveIndex]
                    week = weekArr[EeveIndex]
                    Classification = classArr[EeveIndex]
                }label: {
                    Text("屬性介紹")
                        .padding()
                        .background(Color(red: 205/255, green: 155/255, blue: 155/255))
                        .foregroundColor(.white)
                    
                }.sheet(isPresented: $Introduce, content: {
                    introduceView(introduceText:$introduceText,attribute: $attribute,week: $week,Classification: $Classification)
                })
                
                Button{
                    showMap = true
                }label: {
                    Text("捕捉地點")
                        .padding()
                        .background(Color(red: 205/255, green: 155/255, blue: 155/255))
                        .foregroundColor(.white)
                    
                }.sheet(isPresented: $showMap, content: {
                    mapView(showMap: $showMap)
                })
            }.offset(y:120)
            
        }
        .font(.custom("jf-openhuninn-1.1", size: 25))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(EeveIndex: .constant(0))
    }
}
