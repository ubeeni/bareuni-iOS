//
//  TestView4.swift
//  Bareuni
//
//  Created by 황인성 on 2023/08/22.
//

import SwiftUI

struct TestView4: View {
    @ObservedObject var viewModel = DetailDentistViewModel()
        
        var body: some View {
            VStack {
                Text("Dentist Name: \(viewModel.detailDentist?.hosName ?? "N/A")")
                Text("Address: \(viewModel.detailDentist?.address ?? "N/A")")
                // Add more Text views or UI elements to display other properties
            }
        }
}


struct TestView5: View {
    @State private var items = ["Banana", "Apple", "Cherry", "Date"]
    @State private var newItem = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: deleteItem)
            }
            .navigationBarTitle("Dynamic List")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
        }
    }

    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    var addButton: some View {
        HStack {
            TextField("New Item", text: $newItem)
            Button(action: addItem) {
                Text("Add")
            }
        }
    }

    func addItem() {
        if !newItem.isEmpty {
            items.append(newItem)
            newItem = ""
        }
    }
}

struct ExpandableTextView: View {
  @State private var expanded: Bool = false
  @State private var truncated: Bool = false
  @State private var shrinkText: String

  @State private var isRendered: Bool = false

  private var text: String
  let lineLimit: Int
  private var moreLessText: String {
    if !truncated {
      return ""
    } else {
      return self.expanded ? "" : "더보기"
    }
  }

  let font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)

  init(_ text: String, lineLimit: Int) {
    self.text = text
    self.lineLimit = lineLimit
    _shrinkText = State(wrappedValue: text)
  }

  var body: some View {
      Group {
        if !truncated {
          Text(text)
        } else {
          Text(self.expanded ? text : (shrinkText + "... "))
              + Text(moreLessText)
              .underline()
        }
      }
          .font(Font(font))
          .multilineTextAlignment(.leading)
          .lineSpacing(4)
          .lineLimit(expanded ? nil : lineLimit)
          .onTapGesture {
            if truncated {
              expanded.toggle()
            }
          }
          .background(
              Text(text)
                  .lineSpacing(4)
                  .lineLimit(lineLimit)
                  .background(GeometryReader { visibleTextGeometry in
                    Color.clear
                        .onChange(of: isRendered) { _ in
                          guard isRendered else {
                            return
                          }
                          let size = CGSize(width: visibleTextGeometry.size.width, height: .greatestFiniteMagnitude)
                          let style = NSMutableParagraphStyle()
                          style.lineSpacing = 4
                          style.lineBreakStrategy = .hangulWordPriority
                          let attributes: [NSAttributedString.Key: Any] = [
                            NSAttributedString.Key.font: font,
                            NSAttributedString.Key.paragraphStyle: style
                          ]

                          /// Line Limit 내에서 문제 없이 보여질 경우 체크
                          let pureAttributedText = NSAttributedString(string: shrinkText, attributes: attributes)
                          let pureBoundingRect = pureAttributedText.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
                          if abs(pureBoundingRect.size.height - visibleTextGeometry.size.height) < 1 {
                            return
                          }

                          /// Binary Search 방식으로 '... 더보기'로 라인이 적절히 끊길 수 있는 index를 찾는다
                          var low = 0
                          var height = shrinkText.count
                          var mid = height
                          while ((height - low) > 1) {
                            let attributedText = NSAttributedString(string: shrinkText + "... " + moreLessText, attributes: attributes)
                            let boundingRect = attributedText.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
                            if boundingRect.size.height > visibleTextGeometry.size.height {
                              truncated = true
                              height = mid
                              mid = (height + low) / 2
                            } else {
                              if mid == text.count {
                                break
                              } else {
                                low = mid
                                mid = (low + height) / 2
                              }
                            }
                            shrinkText = String(text.prefix(mid))
                          }
                        }
                        .onAppear {
                          isRendered = true
                        }
                  })
                  .hidden() // Hide the background
          )
  }
}

struct TestView4_Previews: PreviewProvider {
    static var previews: some View {
        TestView4()
        TestView5()
    }
}
