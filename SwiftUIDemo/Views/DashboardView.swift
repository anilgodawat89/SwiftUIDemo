//
//  DashboardView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 04/08/24.
//

import SwiftUI


struct DashboardItems:Hashable {
    let title: String
    let subTitle: String
}
struct DashboardView: View {
    private var data  = [DashboardItems(title: "Average Billing", subTitle: "Avode bill hike by sign uo the values"),
                         DashboardItems(title: "Average Billing", subTitle: "Avode bill"),
                         DashboardItems(title: "Average Billing1", subTitle: "Avode bill hike by sign uo the values"),
                         DashboardItems(title: "Average Billing2", subTitle: "Avode bill hike by sign uo the values"),
                         DashboardItems(title: "Average Billing3", subTitle: "Avode bill hike by sign uo the values"),
                         DashboardItems(title: "Average Billing4", subTitle: "Avode bill hike by sign uo the values"),
                         DashboardItems(title: "Average Billing5", subTitle: "Avode bill hike by sign uo the values")]

    private var gridItemLayout = [GridItem(.flexible(), spacing: 15), GridItem(.flexible(), spacing: 15)]


    var body: some View {
        GeometryReader { geo in
            ScrollView{
                LazyVGrid(columns: gridItemLayout, alignment: .center, spacing: 15) {
                    ForEach(data, id: \.self) { item in
                        DashboardTileView(title: item.title, subTitle: item.subTitle)
                    }
                }.padding(15)
            }
        }
    }

}

#Preview {
    DashboardView()
}
