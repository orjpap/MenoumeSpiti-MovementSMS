//
//  ReasonModel.swift
//  MenoumeSpiti-MovementSMS
//
//  Created by Orestis Papadopoulos on 26/03/2020.
//  Copyright © 2020 opapadopoulos. All rights reserved.
//
import Foundation

struct ReasonModel: Identifiable, Equatable {
    var id = UUID()
    
    var number: Int
    var title: String
    var description: String
}

let reasons: [ReasonModel] = [
    ReasonModel(number: 1,
                title: "Φαρμακείο / Γιατρός",
                description: "Μετάβαση σε φαρμακείο ή επίσκεψη στον γιατρό, εφόσον αυτό συνιστάται μετά από σχετική επικοινωνία"),
    ReasonModel(number: 2, title: "Προμήθεια αγαθών πρώτης ανάγκης", description: "Μετάβαση σε εν λειτουργία κατάστημα προμηθειών αγαθών πρώτης ανάγκης, όπου δεν είναι δυνατή η αποστολή τους."),
    ReasonModel(number: 3,
                title: "Τράπεζα",
                description: "Μετάβαση στην τράπεζα, στο μέτρο που δεν είναι δυνατή η ηλεκτρονική συναλλαγή."),
    ReasonModel(number: 4,
                title: "Παροχή βοήθειας",
                description: "Κίνηση για παροχή βοήθειας σε ανθρώπους που βρίσκονται σε ανάγκη."),
    ReasonModel(number: 5,
                title: "Μετάβαση σε τελετή",
                description: "Μετάβαση σε τελετή (π.χ. κηδεία, γάμος, βάφτιση) υπό τους όρους που προβλέπει ο νόμος ή μετάβαση διαζευγμένων γονέων ή γονέων που τελούν σε διάσταση που είναι αναγκαία για τη διασφάλιση της επικοινωνίας γονέων και τέκνων, σύμφωνα με τις κείμενες διατάξεις."),
    ReasonModel(number: 6,
                title: "Σωματική άσκηση / κατοικίδιο ζώο",
                description: "Σωματική άσκηση σε εξωτερικό χώρο ή κίνηση με κατοικίδιο ζώο, ατομικά ή ανά δύο άτομα, τηρώντας στην τελευταία αυτή περίπτωση την αναγκαία απόσταση 1,5 μέτρου.")
]
